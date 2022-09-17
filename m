Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E954CECAAD3
	for <phone-devel@archiver.kernel.org>; Sat, 17 Sep 2022 14:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiIQOpJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Sep 2022 10:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiIQOpE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Sep 2022 10:45:04 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D067F1EEE7;
        Sat, 17 Sep 2022 07:44:57 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4MVDHV4dM3z9sWP;
        Sat, 17 Sep 2022 16:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1663425894;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8yi6HKGZC6c6ZLykHpkZllnQTMYkGQsll9ombCqSEoQ=;
        b=jpMMQ1mVf1DmNZiE0hhu9FEo4wD5yqMmmpXV4VoWigWFCzwZUegiOcEKOGdpoteTxPDl2h
        DkeJLA63ZzwXDkrFwn52O6MxA14SNS+gAor4/0W+RsvU8PrSXx5lDrbRhLY5Rp58mNe/yJ
        tNGb7+gd/G0pyeYDnTpo/fZx4lXybk9JCT+xwEEEELhPvmE2xTVRjDIgqdIzy3PTAVkocq
        hIgxsKjM3l/ZU+8QmVJF3gNY3ue9OMckIfd7/xBvhDOzAUiuwqtCj9HIxBA/h9GAzr1R+P
        XAD3+pFdE4ristrgIiI63Qe1Cw+G/gIRVmbTYorQ+9oqbOPcnAe/mRVfvCe/bQ==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH] sound: soc: codecs: wcd-mbhc-v2: expose ALSA control for jack
Date:   Sat, 17 Sep 2022 16:44:36 +0200
Message-Id: <20220917144436.7802-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Jack detection is currently fully functional via the input
interface together with multimedia buttons, but is not exposed
as an ALSA control. Therefore, ALSA clients such as PulseAudio
do not pick up the jack detection events as they only support
one of the possible interface (ALSA control or input interface,
but not both). Expose the jack events as an ALSA control and input
interface to provide ALSA clients both interfaces.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 98baef594bf3..e741b522cf10 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -724,6 +724,10 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 
 	mutex_lock(&mbhc->lock);
 
+	ret = snd_jack_add_new_kctl (mbhc->jack->jack, "Headset Jack", WCD_MBHC_JACK_MASK);
+	if (ret)
+		dev_warn(component->dev, "failed creating Headset Jack kctl with err: %d\n", ret);
+
 	/* enable HS detection */
 	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
 		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
-- 
2.37.3

