Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D606213DDD9
	for <phone-devel@vger.kernel.org>; Thu, 11 Apr 2024 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712819178; cv=none; b=i0VAKhIRwEhsAPQ08667Y/LZH8U6ggH5gQeAdU1LjIJuA8/NCVKHpV+5hW/4Bhf6h4XOIJU9Q27o3B+VSxk9TJ9hjq1ZllZqHVNOD+Ej328na6dGV7jySNSOMTet2ssCboDsTiEnZF38BUrqQmgm4wywzuplKvjLbyV8HMCpPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712819178; c=relaxed/simple;
	bh=+o7I+daoENcP8Ct9wXBNksspsxmRSv7JiVNJMZWs3cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nGaqTeSr/g1i7YP+67RlDcEzHirikXpA/b9/zVrxAmf6ITd1qJYxLW7UjkVc3kH+5d5jluYVlPfZNeyR5Xnz84GG64ua5kZWBYRm1nFRvWOZoodpCYwxW5+CRYsppK4JX4JGBOf/zHIrhPSK4yKgaxgOcavDhoZ5TZmXcEALRp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vfw7bfqh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vfw7bfqh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a522715519bso12360366b.3
        for <phone-devel@vger.kernel.org>; Thu, 11 Apr 2024 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712819174; x=1713423974; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPHgQp5i5ObZBE7aupcoMPs0PyMl+eJyHyekbE5zlXs=;
        b=vfw7bfqhq2me01f9pYWrujssM0ZpdqY2OyNMTHWnZ0602bCm7OXPJKfa+i9quNpHx+
         ndSMFzW9qXDgd9oBU7FO+WWBsRfv8uVr8Pdrq9/R61rPf7sa61iH3hon1qeKA93U6i8W
         UstI8UQvbLAQUu34OrBWYDi8Djs2CU06MHVTfODGEPa6YsjZ9W6c5ydDX3n2SxHqH29E
         Pz1SO2Uurev7cyiNbtqGeGXWGCBS83l53y0WDfLZfU+9CkcETX1W8nBll8pz+WqbRh4i
         NAeidYSVWmgXy3kx6EHugal5bU7TXZO47mbZDsjv/RNVAA0G383+vabVEdrGFfpPZmFM
         VAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712819174; x=1713423974;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPHgQp5i5ObZBE7aupcoMPs0PyMl+eJyHyekbE5zlXs=;
        b=iv6Po4emSYbPmRx3MW1hg0XlnNLnDDnJHYAglfJPZrICeJQHcms3U20uy5ZP05iO+2
         3rlrgbmHmaq2kGaHoLX9oKsMeB+O3iAFNkl/u4yNqHj+yT6cg6DcxsZywtuVKCnQD5wP
         R8CA1AqxOF7dxhea08pRNT/B/IPSmwaVgvZFla+aJyGTQgk48mOjteZDdAJ4u8QDEHvB
         XC3lqUJjv/dVuXUC3scFRxgnWEXjhTYkrp0Dd+pH6639C6e50ALXsNtm8rcvU1/F2e5K
         SBiq5lhhNuVpJ/ZcLB66ejaHLDOfef2wEHjeekZwJQY2VdFzHuPU2x0/whUQiptbZd0i
         iPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9QWBI/3HhbN0gnvCDOiusWhGQ4iAVcP7YT3jKh1ErBN9MhodVTJHX0Yo39EK+3NDkjDQ8CvrlLjJFxBVA7cnBZC0GXEzVJzx8FNQ=
X-Gm-Message-State: AOJu0YzD8UN500uKx/oU2I3gnNkq/aVouHWRPGb61LJJaJuGsQmjJVI3
	TYM0s9LZhO01sEzPebec50mOQQazUshZ7E7Aw3UqZ2MoJvCVIyqLLF3fx15Edds=
X-Google-Smtp-Source: AGHT+IFwO1V0PB5oOIQfGSzjLElMTnZJSoZTIjXmfOa0FvKysbniFvJxcp6z+3c0bN4piGw2hz2Bbw==
X-Received: by 2002:a17:906:ee87:b0:a51:962d:cf0d with SMTP id wt7-20020a170906ee8700b00a51962dcf0dmr3622218ejb.12.1712819174137;
        Thu, 11 Apr 2024 00:06:14 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id dk5-20020a170907940500b00a518b14d6cesm461397ejc.172.2024.04.11.00.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:06:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 11 Apr 2024 09:06:11 +0200
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add USB-C
 orientation GPIO
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-fp5-usb-c-gpio-v1-1-78f11deb940a@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAOKLF2YC/x3MQQqAIBBA0avErBtQMYKuEi1MR5uNilIE4t2Tl
 m/xf4NKhanCNjUo9HDlFAfkPIG9TAyE7IZBCaWFlhJ9XvCuJ1oMmRMa75RatTTOOhhRLuT5/Yf
 70fsHiFICB2AAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Define the USB-C orientation GPIOs so that the USB-C ports orientation
is known without having to resort to the altmode notifications.

On PCB level this is the signal from PM7250B (pin CC_OUT) which is
called USB_PHY_PS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Depends on (for bindings): https://lore.kernel.org/linux-arm-msm/20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org/
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 4ff9fc24e50e..f3432701945f 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -77,6 +77,8 @@ pmic-glink {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
+
 		connector@0 {
 			compatible = "usb-c-connector";
 			reg = <0>;

---
base-commit: 65b0418f6e86eef0f62fc053fb3622fbaa3e506e
change-id: 20240411-fp5-usb-c-gpio-afd22741adcd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

