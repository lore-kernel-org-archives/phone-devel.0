Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF603372663
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065626; cv=none; b=i/vDbGyzwo2iL8U9fNtWsihEVeClds5EdRvnz12yt97tXeDXtDUl4sQT/iL9K2alh8jeZQybzD0WxAGXjOhfPylBEi133LLl4UcsAm/IZGFHi2WlOhLc0y0ngQtMpZpVAJnx1LTHRPYzPU1kxybQvwc5KxjytoXESDWMRheoKVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065626; c=relaxed/simple;
	bh=34nDGORWSQqcLgVsQP4EEN2mXvHlBSSBG3ZDW0Oheak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQEcVmdyWYJrv11s710mb9wVKN8EigIM9/U/W+rvxzUuENL+i5xSWHWfqo9Dr9CBh96BHMHPGli+0SzFRrvRFM1LOErl0XkxQ1qOIfLZeCWljXDxTXBMfkXjCJucKX+GGMMbY18UqFxHFlimfpauIKcH0UPzjqjNDEyFzthm+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhPQopWK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhPQopWK"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4631679f204so823436f8f.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065623; x=1783670423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8F7QCm3oCmhZ0k8ChJtucjmxHtKA72tkWkJA20N+D8=;
        b=OhPQopWKSiTFyhwUpcf39j8U3d3st5FVF3wxlBTtwB84CxS2wszPYf8dstSSFX9nvi
         0lXJVbocdXVVbt9pjtpfsqMhNMER0npDjH9eiS9SnLJQTjZuFld689aG++Jm46j9hPdx
         40hcLN3oJP2G4Nr6rvqrw4fe2cCPSoH4OIGoN9GN694iUqfCGf1eEj4fvp9Til8Ie4zo
         r9TODeO3SYGYuLtIBt6V5YHrXxSoUvA1/IY3P6oEdu+ep41AxCONj48LzbUtTaqP3+jZ
         Z6DWp+dcKl1XsTnCOGWlf3cy/bvoDCVnivzZjEgAtTEUa4UEbany/k0bKpxRHsva0lUW
         sEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065623; x=1783670423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E8F7QCm3oCmhZ0k8ChJtucjmxHtKA72tkWkJA20N+D8=;
        b=cPAIiD44YIckSDRpKnB9cOuPilGTc8T/R7PRtVdhaFEzreJSZ4zsUQIOwJs0pWQWR6
         blWS2FC5Gw0J9r4SpWyjl83YXQxB1xEnYnut+9I49jGfFchZrm4BvVXzSM584OkgwJt2
         bStwUu94ftYZqxOdqaPNHE3m8ifmd8oVmzFP2TPWvVCy5axGCDYlMZ5s3lThmVymuES4
         8OYHv2JHe7j7cPvEmRc46x++j2gElaAl6QpXP3nkf9llrR8C8PJUTqEnSogWG+QbrqI3
         uNaE2Acbw2IaSUNMiN6QrNgRYUjEDiUxlyWc/XNLLKF1JspZlf5f50Fuckc04RU1/vch
         MeYQ==
X-Forwarded-Encrypted: i=1; AHgh+RruJrXHdvg39/MovtlTSfS2+Ld+rLpbfnNNRLmBIbVzpvc5z1LhNtObQ56piHtpTVuJNeDfWkxEGU4Olg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKk3it+0vdAHZweZl8YmMg9YVK3Cm5aRI7wNVa7W4ZlNCyUVj
	xwfP9sbzm5Dsvj+VU4DZh2XZNMb9GEg1Uc9lUT1RUEf0FMHp+V3Ax4OR
X-Gm-Gg: AfdE7cmOvjUmyXlT7PavVxEFV4I5TUK5xcmUExP49K5qqxd31wNQRgRAxqcoj1GfB79
	u50DjPzEjj5PDP6Wzenu8a5rm3fkpzD6tvzTSsEcx7if75yDj6uKQ6D8mF6W4AqHqIE2pEhCzPY
	WzimtBz/neauyWmH1spmJhfzJBVRbOmpHxb4F2heTXSk/6FzBlp7mWIIlHQwv3gE1LBwEFldlly
	WuynlRS+x58X5WRMdVCX9BVZQxADCT58+OI7ze7SS+7/rYTLRyNVl4vhjDRKzrMQhIVfdiGDe5W
	JmyxQMVgErdX4opM+qitUr7nJTnWpYj7vnP08WBuvlkNQoRqP9mzbC5soDSB1zuH5jctu63VsOg
	+fCAPci89dg2PMIzNTciHwmNH1grxeqX1fMIl0X7zQN1O+3YdVT/2sC1+/6AeDrvbRCnw9bXVxO
	Cw7C9PKVxypxlURebEyg==
X-Received: by 2002:adf:e88c:0:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47936c371cdmr3000082f8f.29.1783065623068;
        Fri, 03 Jul 2026 01:00:23 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:22 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 03 Jul 2026 10:59:39 +0300
Subject: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125
 platform
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
In-Reply-To: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0635cbeacfc8..50f500834758 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

