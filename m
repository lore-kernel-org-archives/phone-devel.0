Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F64C54EBE
	for <phone-devel@archiver.kernel.org>; Mon, 16 Jan 2023 22:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235105AbjAPWKM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 Jan 2023 17:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235056AbjAPWKK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 Jan 2023 17:10:10 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2402B08D;
        Mon, 16 Jan 2023 14:10:02 -0800 (PST)
Received: from localhost.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AEA453F261;
        Mon, 16 Jan 2023 23:10:00 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/5] iio: adc: qcom-spmi-adc5: Remove unnecessary datasheet_name NULL check
Date:   Mon, 16 Jan 2023 23:09:08 +0100
Message-Id: <20230116220909.196926-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116220909.196926-1-marijn.suijten@somainline.org>
References: <20230116220909.196926-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

datasheet_name is statically filled by a macro for every channel, and is
nor should ever be set to NULL.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index 01aafd9df6c6..5def2b21f206 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -649,8 +649,7 @@ static int adc5_get_fw_channel_data(struct adc5_chip *adc,
 		chan = chan & ADC_CHANNEL_MASK;
 	}
 
-	if (chan > ADC5_PARALLEL_ISENSE_VBAT_IDATA ||
-	    !data->adc_chans[chan].datasheet_name) {
+	if (chan > ADC5_PARALLEL_ISENSE_VBAT_IDATA) {
 		dev_err(dev, "%s invalid channel number %d\n", name, chan);
 		return -EINVAL;
 	}
-- 
2.39.0

