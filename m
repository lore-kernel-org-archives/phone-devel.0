Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71371A9F8C
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141891; cv=none; b=liR1UivPPFMFgesB0scT6gKg34ItTpP0snYOFGlBqC0IheashLdrz07Pwh73Ev2nseNGtjJGVX1LCvwreE3Xx/MDoMVk3n3zOLNMOEduOoF/TJgdQcYiy6AW+STxIbEpJ9DVdbz2mSo/QuOGrK+zmP2d/FDPTuZBGNjRcy0H/I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141891; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aqu6DayYi3lZq+DQuhknSNi/qkfxauyMpBThTewwr5esR9kFKogFgZmGXg9UCG4mwbbviqgaIDV4lZYGyE1I3IFN3ELO6dsNFUYJDp8yqi091hv823jE/P9u/409TUqiGcB4pADUphZ4AbZUT9edhgddzLQB4SejtGEHYDn4Ttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNA77ZAB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNA77ZAB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so116310785e9.3
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141887; x=1777746687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=qNA77ZABmGYyRinjOc2E4dORhLQmY33aZnQOhmikiOiuDjqubnKYUfmAU7b/19OiIP
         S3glB21ABZKlXBMRBYnIY6UemA3/jE1+Fy9Ms7W5EyDT2pRenc0AhL7mq/5COej9L3cE
         JH0kPDAkTBcbd1hJf3vbbpAJBzHZ2PEvew4eJEndafZas+hDWrWw0r4eegfW4DBC+Lxp
         XhN5MmNxP2qdKaut6Yiw24ntcITRuCTpyVLUW5MmeYBQrvHDAoZkumnOIN/W/ZrZRmZU
         gh1NknLEmgzHq+okCHe/3t4nXa2KdF/CI230WbX/hgYK/yYIe+5Tkvx8LC5O2o+6rAhr
         DNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141887; x=1777746687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=Sok/K2BD6msVe1FnnTcJpueh6angBxP2qJqzRVb4yT0JSpX2iCk56wHc8XqyCwQlM1
         766CW6QKSKBXKDe8z9ss2evYd3i4mdQPOdJ5loVwLgcsN1Bvf1mcyO7hl+C97XhSdbsj
         rVGb3d5QmBvlSPohkJlFdpDMCgOtGxOAq5tbDrOX8csRHAKcU4CtWDqqm/N0UZy853Y8
         6amqIzTfgHdXR5eRnrRKkp9DImmhMaCrDoH0YvxYbNCZ0Ag/Z1TjV4EZU9ySbMYzGF0V
         fbfUwZkX14S0TfN3XiLo75kjmSpnQSmbdzM5sA5RoSh3KlqXNEHDWYNbEr9a5ko68JeD
         rM/A==
X-Forwarded-Encrypted: i=1; AFNElJ9QpJI4+UxwT681J17prV+oAe/5iMmje5T0GORtsJhMWPW5U2W0IgFc2uieLewC0Z9q25M4AEgkqTpO7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0ipShqSWidaH2wT2CP1VtRfKE1Kxc6FjCEAwCEiXNR/eapZX
	M3STRlwfvTPF/pkMKihx3SVe0LnyhAndg9ngLLdxAX8fj3q8It/mmjCu
X-Gm-Gg: AeBDietAB9P68DW4N/k22Ry1VPd5DlBMJgRkyW5JFqlgT4X9kyr5pbqVNPlhrpVhbqf
	kiqiUk/97yt9Xn88Whq7m7CS+Woa2kZEfXydpKydDJbjLgbU5IlN6Ff5rjrn9KAizpVT2MmAv4n
	5DwbVYASESoKwgktmZBajpK5NaxJN6StynvnJblcXZrSY9NYeRYIVFhQ6AbSkHxltgzbfb1kNhV
	NHO0CGwo9V81nomQ2f8iEbfzvUcb8bCm08V2FWBoVHAwXdIT7rxeuHYvnUUrq2/Qe0u5ED+puR7
	vDjZ26DQHqmzDtpIYfIEXVJmr/LBLYFYKgqaXfjjE/eQsUJZFEShtbizxZTqnJogG9qJHt6E22R
	N0I7kEVgdT9oH6FoL/rsyPsDB7RBv3pMi9C8UGDxonb532S21PClzSUAzlWErJKN2sRXVqdEAU+
	e1hCua6bIYJlHwho8dVGWzBOuiJEoBAvtNYgQ=
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr401209905e9.18.1777141887310;
        Sat, 25 Apr 2026 11:31:27 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:06 +0300
Subject: [PATCH RFC v2 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-5-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

