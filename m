Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E248595E
	for <phone-devel@vger.kernel.org>; Thu, 10 Sep 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043264; cv=none; b=riT6wfV1Welg61ntufYyurxcG2PKglRhGkb1L1q8e2Bn1L1gkIE3evDkj1HN9UadVpcByPhrjE+hDyJ+awDelpyx4+KDFsiMdGM8pMXVGPqnBSYDoYuNKcz4GNV4dT2zgmOw1kbCj1H3IsjOPppSgYEKeGobPNXEAz4cA9bYfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043264; c=relaxed/simple;
	bh=Lh+SwH21jhBJph617FXvRF5JB190/NoNd9H1iE00Q2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tah6XtvYGakibgbo82CrVCJJ2iN/XVbXKSD89A1wnXv7W+SWnkkDwJbNViHrnnX78c3XT2z5fjAvEUYalU2fdvB/Up6s5u9S+wtQkf53IKcjRKe3soUbYYdDWYqNsCYocGh9OIySFhGFM3SBBjpCuCH7ctmdNG4+8I+uMPrCm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMxbFDFm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMxbFDFm"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c255c58156bso1489115366b.3
        for <phone-devel@vger.kernel.org>; Thu, 10 Sep 2026 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043260; x=1789648060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=TMxbFDFmt3hxXLACKpMJJLpqffUk9hvoGdFYTa7ULXzo9tOMwkHqFeIkwQ2l6tfBhq
         LOQA6YGzvWI+GKv2ddjzG1+j1ejGIFOob1h7gxDn/jbotZzlhty+PRsRTNhfEp99y1X7
         RkIcpAKAM4+Cw0qbA+BRwHFyI66jInSRShrOqnrk7P22MQkKeoNG4yHrPnQGOlvq+Nr+
         Q3FCLfFe+g8NDqk25YrcAqSN1plG3Tmom0nw6P2MFwVZXavRUnm21cNCALY916ydyjU4
         Ns/J1ftRW/Xeyl67UYVheYg9Na8P+lCm5XWjtD0NCEBIcIHXABEGZOGz9rioVu+ABiEc
         b7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043260; x=1789648060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=PKZWbmpDwZueWFa62Pz6XMS9tPI2dQLzNK7wnIhHLtu+BZocnTHM7gRnj6ASOWOfTc
         F2v3Wg5Snt5l9kfpl0E33Gzin34eDYR8LYJxTnaQDpLI30+hFRHbLmmnTidSMh1I0PNk
         ZBQa1cdtkJIZI8TyWoYdmu3moOC+7wKM62pbQXiRFoK7gVcaKlHk33BxKpprTC/y+8Cq
         lzcmKcJ42+nCgAi1eFFboQvouANL5AbblRPAeWyTAFHShKiRh7Sibn4PkvMi2saZoyVC
         15WucLywb1H+DArgPgbGBrEeiE/Q+JEM18MWM2Oy7vfPnhff5mOYPVJJTQwzBpswtg1s
         OBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSladNtnDU4O1uVaEn76qa/LeOL8u091KrJuWIrpR9R+fA/RXiGtQxtsR/19CDDSniFoEJyLSFDeipnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nuFkmFkMamsy22F3lxBGic64uyJtyfnDSsWMeDoI3xHMkxFKbx
	nXTbJByW1PMjTVxtCbOSruMKZjKSXmIQrcIauiKSWeg7BRSwTC7dUMVkOwVshw==
X-Gm-Gg: AYBFou1CBqlE8B7w/O+lceeqWtYXzdAaz4QywwCeqt3k4puDurCPD22xGlC7OASPI9K
	8OFKQjbhNAUP9qX5eVZHXfM+vPljPUh2QMPA65kM/dSKW4koKoXzOyp0hIAXlFDokw91FPOYV9j
	114pp3D5tZ5dLtIgB9WGj+qAmu1TDD1AnL+1A/7x+tZol0NcihxYlOcOxSBGoRofyEnd6DS/HSC
	bNltn6a2SqkdjP9MW0OCuXzW0GKP/Uz68GB0rkNR9m0jzVqro2TsxCttuLX3TTxCP4CiXS3KK+P
	LjCI7GyUUXCNaKwUOcHlX00hZ+0fzzOILrYFxfJ2hUifDMH839UJSH4RJRYCiWbxlo92q83O7T2
	GY3xBMY/eDJssTlUdmo9Eaq4K74ObFdD9/XpFfqS0SvxRb0Vywww0AZ2e2q5CLiqxb+mvb/Inhp
	/s036gFrlzTuqItxqLXI1ts7KaPeT0Kub37rBBWVleRd7pIfJtvfGWoPnLTQ==
X-Received: by 2002:a17:907:6092:b0:c25:64ea:4d70 with SMTP id a640c23a62f3a-c260c65c251mr1785575466b.1.1789043259949;
        Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2951217d12sm65136066b.44.2026.09.10.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 10 Sep 2026 15:27:22 +0300
Subject: [PATCH RESEND v3 2/3] firmware: qcom: tzmem: disable SHM bridge
 for SM7125 platform
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-sm7125-samsung-v3-2-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
In-Reply-To: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..91d59e3e5988 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -82,6 +82,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

