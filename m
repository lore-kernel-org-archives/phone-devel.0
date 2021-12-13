Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2843CC433EF
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbhLMIYR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbhLMIYB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:24:01 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A60C06173F
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:24:00 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id t5so49005378edd.0
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zo1R0GM0UXlhxwBbFfCIG2U5SV/xuvwi3CEgGxo6XA0=;
        b=B6ILK7l7/R7BR8pTA4+BupjqBADlYwCTcMt3Bb7D6HSxt+u3Udgd5hZ7n1CFG+w6sK
         jxhdDDDtJAg6TM174W14DSF+Y5aBybvOaOYPwIzKOZRziIz/5QPZx/8sJdavS2M8ulow
         DfCdzZNH+zaP9FYaxSYHc5dUwzML6gzAwS/moPb2KPEER3MlWsS3fa765ewY+TQedlsl
         HLa4Fzv0bjSUIFJUUeL3LtKAYLg0EzMfM8f1lndEUd73BUWHnraJKyhsZxdGxPPfH9/m
         9weDbSEcSm32QyFCjXL7K56OeYmxAKjqj+IdiyzEDPh3NIU9Z/jHbUo3tolSQaBZHh+M
         qAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zo1R0GM0UXlhxwBbFfCIG2U5SV/xuvwi3CEgGxo6XA0=;
        b=blgUTHBn1T2NmUqJ0sCyXm3QBt0OC6szaOswRHzYggzQH9Es0TI0vyUPkgPJB1GkCz
         /9PgFS58M9/e2FsCX0F/+DfZGsIj4Swi9wHbsoEIAJnh2zqilRKCzNIMxdb5OnrZw7Ae
         TKMparuzQveIuwWKul0cx5gcbZJ4wPHH1FlO9IeeIiw6f/+w2Xi0C+BP9Dm2PVFFiR3k
         2/seXgIkSFrEHnVNU07/osGT3KU5vb/oEAQcYs+1tPgX1sPHdJokAwxsWHeF0YVeN3fY
         7VVbSW/54XXBT7IJ/xK50210O1VEVh7JCUyURiv0Xb+eGRi6TvoK/joPp0JN4Y4zx9lw
         RRdg==
X-Gm-Message-State: AOAM532BCt11C8w+sFiPNzIyFu9H+Qmh9FW2dWc3A5a7eVQHPaU4cei+
        cw3wPpHQCkdOecQ8Y6SzZ28REg==
X-Google-Smtp-Source: ABdhPJyYyNjcuIuTB/ROUCBIZHl4H+Qh26CqBC52TIvpgxft68UMqmbXVXjZkT9DOw0iI17lns/QtQ==
X-Received: by 2002:a17:907:160b:: with SMTP id hb11mr43410450ejc.336.1639383839256;
        Mon, 13 Dec 2021 00:23:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id nb17sm5535561ejc.7.2021.12.13.00.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:23:58 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] remoteproc: qcom: pas: Add SM6350 ADSP support
Date:   Mon, 13 Dec 2021 09:22:04 +0100
Message-Id: <20211213082208.21492-5-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082208.21492-1-luca.weiss@fairphone.com>
References: <20211213082208.21492-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a config for the ADSP present on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2d43aa0dfeb7..1d28036e0265 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -524,6 +524,23 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 		.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm6350_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data sm8150_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
@@ -804,6 +821,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
+	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
-- 
2.34.1

