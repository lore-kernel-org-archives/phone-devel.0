Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF84C6FD1C
	for <phone-devel@archiver.kernel.org>; Sat, 25 Mar 2023 14:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCYOWB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Mar 2023 10:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjCYOWA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Mar 2023 10:22:00 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF5B12F34;
        Sat, 25 Mar 2023 07:21:58 -0700 (PDT)
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PkLqk6CLDz9skg;
        Sat, 25 Mar 2023 15:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1679754114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5LSD+kez1XFmSv8Jj3qsqV+B5Ky+NhkoeQXRmyAN+C8=;
        b=LlaPYFY/XzKeNCixql9e3nZ3izQsmtt1VFVsZp2RVNXp7PkndmL3smCH/tl8JQuOBNTG0V
        gO/L3O7yLAj53pg+B4c6uF5HTLlPLws+MlTOBBIObhqv94BzeCTlBaMeFtMb6z/Niko/6b
        v6QIxUTbNEdJ8cqAHN8mTyyCdbVn1N0D5EMpIh7UZb6T2na5FxvQhqiCjv/9e+mTtTALom
        J/M0WIccM+HoAcbrkMSGDSl7FQBm+x+ByMQftjxnbM4UHY2b/ZRyxO0JlJjwwMwIU0aVmS
        V0/DtYxPJ9tYNoJeL3vtpqeI0Im1pDZxVGbTFiPBkW9y0Cl+2sk/nIgAHId+EA==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Banajit Goswami <bgoswami@quicinc.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
Subject: [PATCH v3 0/1] Expose ALSA control for jack
Date:   Sat, 25 Mar 2023 15:21:41 +0100
Message-Id: <20230325142142.24337-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Qualcomm SDM845 features a headphone jack via a Qualcomm WCD9340
codec which has jack detection through the wcd-mbhc-v2 driver.

ALSA features 2 ways to expose jack detection from the kernel to
userspace either as an input device or through an ALSA control.
The wcd-mbhc-v2 driver only supports the first option which is
insufficient for userspace programs e.g. PulseAudio [1].
Therefore, ALSA clients such as PulseAudio do not pick up the 
jack detection events as they only support one of the possible 
interface (ALSA control or input interface, but not both). 
Expose the jack events as an ALSA control and input interface 
to provide ALSA clients both interfaces.

[1] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1377

Changes in v3:

- Improved cover letter
- Added Tested-by from
https://lore.kernel.org/alsa-devel/20221007155716.10594-1-me@dylanvanassche.be/
- Properly added maintainers for sending this patch

Kind regards,
Dylan Van Assche

Dylan Van Assche (1):
  sound: soc: codecs: wcd-mbhc-v2: expose ALSA control for jack

 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.39.2

