Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEE9C433FE
	for <phone-devel@archiver.kernel.org>; Fri, 11 Nov 2022 11:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbiKKLya (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 11 Nov 2022 06:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiKKLy3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 11 Nov 2022 06:54:29 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDF03FB97
        for <phone-devel@vger.kernel.org>; Fri, 11 Nov 2022 03:54:28 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id kt23so12033256ejc.7
        for <phone-devel@vger.kernel.org>; Fri, 11 Nov 2022 03:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KT+IyUbDPgQQlWcRFzbSRfNvsGmzKx+Z/uhCme7VWmc=;
        b=kVCO20cy5h0hDmnQoPeqHuKZrVNqVsfbNR1k3H9g+pDEMYkfizlmqWzDbuKrsViL1M
         2F4P6UINavWtbo/IlrFZsMLvrR5zjl8yxcF77Oazajh9lAvtv9Qcqf1aMzDU9/KI0SzZ
         vn3X4zR4kbSijDnL2S5rNHPQ4rb1BL0twyBEA7kjewSaxBoOk+ONGQ/pCH13NMR1gqHT
         Q08HqlbE6SKMZ1EQnbL57ldNAaSS/jkO3tm1eVq/xBU6+bhMv0ckilxN3CVabwJZeE6e
         I/aqQF0d4H1+lIZCShy83MfQuir35Arn+pEod6egWz4W6sw8OfDZR1TmMXsrOPQsTiZ+
         MxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KT+IyUbDPgQQlWcRFzbSRfNvsGmzKx+Z/uhCme7VWmc=;
        b=A90c6A6YKDQMMvUhiD+9S9KoCjcZRf4+vsPWxC/O+nLIL0BuPa855nbm5SXl4JhcWN
         nCn231SaIzz8kUo9VF3i7b5HLYwFOJ498pmAaUaenQojrKC524TSTJhZQKjtziGIekHT
         1Au1aMb9hapFZdm4kid0zPgyWi3rJrS8/LztjpJSPpcVcy+h54eqg2yChkVlcIjtljhW
         WBuSduqRVvKpg7EAUQd/rt0bfBH7IoxbDSAV0Yv8MCD6i2MebKoMAN3N9hVlGlzlZbyT
         dJS1G8qYvkhA7KonS9gn/CbSFtDJfx9lHbbooMrL5fzuXIZrxMs2Ww+XvlJij0d4RXAF
         v5fw==
X-Gm-Message-State: ANoB5pnox3BbVXZoEL55tK+hw0G4t6Nnx0JAYaJAF+r8j0D6s66e6g2U
        Xt2leN7FOUIWvcegfdCMrqZPbA==
X-Google-Smtp-Source: AA0mqf51E4kTEKCPNnbmq3zFSgb7r6KxMO7F0HshK6l1kGpAw8myLB5RotXH1wK5b7pzP59BHhz0Cw==
X-Received: by 2002:a17:906:3c14:b0:7ae:c9d4:7073 with SMTP id h20-20020a1709063c1400b007aec9d47073mr1295102ejg.711.1668167666768;
        Fri, 11 Nov 2022 03:54:26 -0800 (PST)
Received: from otso.arnhem.chello.nl (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kz6-20020a17090777c600b007adb86a1e1csm770859ejc.186.2022.11.11.03.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 03:54:26 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_pas: disable wakeup on probe fail or remove
Date:   Fri, 11 Nov 2022 12:54:13 +0100
Message-Id: <20221111115414.153961-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Leaving wakeup enabled during probe fail (-EPROBE_DEFER) or remove makes
the subsequent probe fail.

[    3.749454] remoteproc remoteproc0: releasing 3000000.remoteproc
[    3.752949] qcom_q6v5_pas: probe of 3000000.remoteproc failed with error -17
[    3.878935] remoteproc remoteproc0: releasing 4080000.remoteproc
[    3.887602] qcom_q6v5_pas: probe of 4080000.remoteproc failed with error -17
[    4.319552] remoteproc remoteproc0: releasing 8300000.remoteproc
[    4.332716] qcom_q6v5_pas: probe of 8300000.remoteproc failed with error -17

Fix this by disabling wakeup in both cases so the driver can properly
probe on the next try.

Fixes: a781e5aa5911 ("remoteproc: core: Prevent system suspend during remoteproc recovery")
Fixes: dc86c129b4fb ("remoteproc: qcom: pas: Mark devices as wakeup capable")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 6afd0941e552..d830bf13c32c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -557,6 +557,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 free_rproc:
 	rproc_free(rproc);
+	device_init_wakeup(adsp->dev, false);
 
 	return ret;
 }
@@ -573,6 +574,7 @@ static int adsp_remove(struct platform_device *pdev)
 	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
 	rproc_free(adsp->rproc);
+	device_init_wakeup(adsp->dev, false);
 
 	return 0;
 }
-- 
2.38.1

