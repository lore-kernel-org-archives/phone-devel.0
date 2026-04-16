Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F83CF03F
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347094; cv=none; b=hTpjV5JXd+U1DPEzu3FG26R6Rr3LSPKeF+IQvM8ZMZ0d7HUOxruKTIHmP/Js6yXQYaN3wqiguHB2N2H+g4wZdx2ASOwEPan5R9V3AyRU1L9cHbg6wstZLtBa/4f0vz/MbIY1lRNOkL7lXmyRLymzQOUOgsW6HLDvT0zSOk86Tg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347094; c=relaxed/simple;
	bh=V83toJRzq8U8D4mGDj0lJeN58s6MqU8MQGaAbFH2CNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4idEXEJdGQyV9b1Osjoa4W6uAf9i2pV7RACZl+/YbHD3casZl/SUdozYefAq461N3C9RkPp3x1tfN1fvQkn5rtzFvUAQJ64x8/6OFUTKGn3g4smTO1UQjhwkhg3SaBsXMWhcKkXdukudqpzSV5D9ffox9uGSSDwLPpyXrGg4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjvvvtL2; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjvvvtL2"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986e0553bdso81191917b3.2
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347092; x=1776951892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtnVA07z93Sa3PHIsBwQ1JskBEYwpeJ7GU4WtOXVzaI=;
        b=SjvvvtL2e+RJbFO2GiwZ+xRA732PLucVmcgtxnuG5gvNlzwUGeXe2pbxDuGnEn3G3r
         7TFDz/u9sPLcSCf/I89T8MNkcASNU3jKzz8vRSmED4CdpLQ5ny9ZjGytKrLl0M7Rxr7n
         X4I1jLr3iUVVeiPv1Vl6frD5sHdq5TORiTs66sPylMZPUBZJJDCROtk5jQE0OrgtyWvm
         xQjYFH8OM1wKCk3gZ1ET30iE9OBmSpBOB97BbYnXr1WgjmFnSe0gn+r2enNMB7VmsFUL
         76NcdQG3rnWf9kagPWDXJ5BNUI1XMuHHkqX+2d6JKh7te6+LwYcMQZyQ2itN5qcZskeD
         VAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347092; x=1776951892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KtnVA07z93Sa3PHIsBwQ1JskBEYwpeJ7GU4WtOXVzaI=;
        b=PPgOsCvmT81hzpyK70CCppTLVNDyIuEIAJ8u63Mv9pQ1p4Id2vQcnlapmwQoJ9T32B
         Kio43hNjnME/cVhdiOqI/WZaoepw8GCd1qD1VdhTjB1nMTwPOmhhkXSXVfrFPcPZ9j1u
         imDwdVNfzwS2H8mqhwD3JjYMP41HFslpDYuJE/3dIvgibfdl2YOc6b0TnjI2O8+CSrze
         HT83ejop8DgJ4Wvgg8eQhhsBswqanWOQTrkrWL5udnn46uc2YCklWLLjNmQf8EO/nJ4E
         565wRxKbGTFPZf00nvhe/OeH4zoW2vDWDteaDm560hFKf2SqAuyxYLItq8CGaSK1cmQ3
         c7xg==
X-Forwarded-Encrypted: i=1; AFNElJ8cmQbkkRSkffk5PnxU1XwrMQ9UWiun9t4KCXKI+rawqhuTCVtqGfunprj0lPzI1IUg1Yvu/GJx8kL+3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCbTp9cQhXIyCJv2Hy+OBe19hVb02uv2cUd3OFLbca4XNrqsn
	GOyqB5Q+t/s4FTzexxcBM+PSsuxCaoS5ZnlgirSINtSWFoWKr+CUp7zo
X-Gm-Gg: AeBDievCejvWGIuHe7VJVvyUZ7C1M9lv0E4s8ebJn/qitLv7bOZ6NQaOtjz69ht61vE
	irdohJOEEAfri5vDPAP2Ijq8sicqkb9oRybncpbm31NTpQRXVucQQ/mSiE6nhLkHlirfwBRRNZL
	soC11UEJAVWqk+sOjKaA0u3hKf/BOMnheRoX+zjs6Yl+HBJood29nmrTwLGWCWlcosetDwPe/4Q
	uHYCtVQqlOMt+b+sxVALo00RZ03zSckuTtdUzo9j7kz6jq3s2J2bxB52AI8UN61DR9+iG3bGQ2r
	gGMDdWWf6Wwrs+n2z9/lD6xMYqIM+kaQ8CMQiW0ZJz1AN5TPXp8HJz6Rq1HlvENgoXI9afQZmda
	3UPBpKFBT9q826MoNJ6uJPrgy2w+LZDSroMvxhgJMcm4IBEUFTOGPYjr78Zy8DyPyoduEvZZnJC
	BU5R4G3buwH48E4RQ+7rvAd1ue9w==
X-Received: by 2002:a05:690c:6983:b0:7b4:378c:f72d with SMTP id 00721157ae682-7b4378cf8bamr136828277b3.42.1776347091671;
        Thu, 16 Apr 2026 06:44:51 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:56 +0300
Subject: [PATCH RFC 09/10] media: qcom: venus: Move HFI v3 venc and vdec
 methods to HFI v1
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-9-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Some Qualcomm SoCs which come with HFI v1 like MSM8909 and MSM8939 also
have dedicated cores for Venus, like in HFI v3. Move methods from HFI v3
to HFI v1 so they can be reused.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 66 +++++++++++++++++++-------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..cc21a4762188 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -328,10 +328,56 @@ static int core_power_v1(struct venus_core *core, int on)
 	return ret;
 }
 
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec0_clks);
+
+	return ret;
+}
+
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON)
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+	else
+		vcodec_clks_disable(core, core->vcodec1_clks);
+
+	return ret;
+}
+
 static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -351,14 +397,6 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -376,14 +414,6 @@ static int vdec_power_v3(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -405,9 +435,9 @@ static const struct venus_pm_ops pm_ops_v3 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.vdec_get = vdec_get_v1,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v1,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };

-- 
2.53.0

