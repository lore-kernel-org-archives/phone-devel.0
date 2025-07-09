Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9372749D1
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052728; cv=none; b=nP6wdGkw2YWUL9HOxSBcWe0Rtcelpgp5uLfdEmEPXmGgp1VvfX8XFxRMGBziG7riH2Awz2PRbIg7v6r7BD7NJKmog0GNIzu8WQrFEZ/r6IxnTFwmXC6SRNflR5RAEgUZPY84x8pMZ7LiJ2/FKZf31nx8P6jb4yjHWYGUstRr1wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052728; c=relaxed/simple;
	bh=ypwpLrRTvDMuCRzzHaQyRH1tZrFg5WTx+gHcQSKkU3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjG7p+AsgyAx7TrNMwzBzFj1K4HYtmew43EH09DGnjIVwPUKQ7eFMnCVkvNXwr8qtzgQgXyZLJrJzpG41yTO70mPT2sGERdrAiv08TJuvqyzwkp7NpJQgSvNrOWEG3KFxEhfgFjhzj3ylbEGLQuSzZh8npbRQVTN8AoGF+6l/No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kOugYCjH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kOugYCjH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso10240739a12.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752052725; x=1752657525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k19wXpNqnFMbk5R7eovbUjQ7UB0GYLr4+9IyBRmyPec=;
        b=kOugYCjHPsGx+ilJfEi2PN7DnIQyn4utaBS1iMlc6XqP3z9VR4x0LSMq2WelbJ5aHP
         5et4bNen8HjWu6jB3PkVJyAIFvSLXzQ/D1Yi1ggiDYoDckkoVp8ar4pGHpbURUyAvFNo
         R2JLJX7g1XxPqU0u1K/ay94qYd0tQPYOCcSF7mh6WhvklIpKOhtjpP+mP6hWQv5OgU3o
         gEloaS0VdDKeewyHBEESEBD2iw7SH007W5xtdXkZN9++fqy4pYxO8PBWrVdsQlbPLbCc
         f6NOmTTx9N7v0pxxwHk8qycHDTEbpaBH/o/wdfzLJPSyjqk4YEqv4nYbuB9zSl9MFI46
         673w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052725; x=1752657525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k19wXpNqnFMbk5R7eovbUjQ7UB0GYLr4+9IyBRmyPec=;
        b=faF1GoKc0B9L0/E8Ad53kvyUU1OuGzqTPA+XcexDyK7iN7fcr37KndF2/xtUoZEFeT
         vIE24AfCWpk93TkH2DNUNFTZRgi9O5QyjhEGCy/sqbn5MHb3NV2flyd3E/TLusc1QHRy
         jXn99y3VKD43s/fFvBTDjm+qk8rB8amSYf+1FK0B3oQU+HnioMxANlL8UJ8XPCJPw5hZ
         J5gpdrd0a0vP25q/+zAvM8cdhoUyGYervvawPHxtdBwE3qhvsMLGi9LoGSE11e3xCFo5
         e92Qa83FCRwS4zEdXbfZqdL5oSXJE4nZV9FzDE6ZzKk7pfrUkspUdyak+2crUEjgcMXC
         jkGw==
X-Forwarded-Encrypted: i=1; AJvYcCUeA2jtWRtX0qI8bl1JSVouNLT9zwaHe/K7ZHz5nTxjEpSN8ma8iJOup9fbEV2qNqf0TK/40IZNU62eJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfl9Iubhkmnnu8+ilPCDl3pkTQimlCywJZsGUhKiHgSQvR+JHh
	04lw8FBvXOc3+BZPEbmGBTRjR6dTfBhD224QlFVeXeV6zsXrdEBMDIxiWOBtP874/VQ=
X-Gm-Gg: ASbGncsk1rR2mWcngQM+u0IxHtNLS9ut2QkIAl1GVyP86geyXobf9WQRWDayLhw8Ewo
	Yhbzn8Wn0eoz3QInHFeMCtx08Z+lE0OfqyVOU9KqKOtnSXP18JNZuGJDc5Gs3tOmH35cCKNp7hS
	R1dtBjezNY2umd9SAHvtWLrfFiO+fmkUJJSJhIBmZzA9Cxqbd0XqLJqCDVNoptBsMuEbsUWA7Lb
	9d5OpCSzElTNCuFLPMgUjKk5WyTuy+8JBW3Jht1/+/Lu1PiJa0qPz//fyyrG0lfiGCzOoa+88Fu
	m7/2vA4tnXzW6zhXJOl83Lseo3w7rSbZaGsnyW4Ddq9Ycl+k8lnL1P2vLXa+9Gw8YR719ccGSpI
	4Mk0QqqV7jvs/0vXJQkgvqOBeVZylsg0y
X-Google-Smtp-Source: AGHT+IEldUKbclROxgKKvDj16YdbKCkfb5vsSnzNDwXOeeA+MdVlRejqQ2rYPeZd+UWqDhaqfEndNA==
X-Received: by 2002:a17:907:3f1d:b0:add:f191:d851 with SMTP id a640c23a62f3a-ae6cf70f6ecmr193619966b.32.1752052724529;
        Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e737sm1060116866b.142.2025.07.09.02.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:18:44 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 11:18:17 +0200
Subject: [PATCH v2 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-phy-v2-3-4790eeee7ae0@fairphone.com>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752052719; l=1183;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ypwpLrRTvDMuCRzzHaQyRH1tZrFg5WTx+gHcQSKkU3w=;
 b=qWz3s8ZAOTflgxuX1N6dBmF5nLHnOvsOGcagHqbmagvbHIa4s4DGNR3HHtOQx/6KBWkS49b78
 y8aXmLEU/40BkHdwOhmwGYx/yUn4lOmbIbaH1RiDiedOPOnvRiI1YBJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
sequence is missing setting the CMN_CTRL_OVERRIDE_EN bit back to 0 at
the end, as per the 'latest' HPG revision (as of November 2023).

[0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329

Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL, 0);
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, 0);
+
 	return 0;
 }
 

-- 
2.50.0

