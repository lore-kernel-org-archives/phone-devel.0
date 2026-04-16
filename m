Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E53CF68E
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347082; cv=none; b=kk/Bkfpa9XnZOtW9E4rqGAh/wFxMQMySdbEfk9G6p5rBvT1D4MwLdxd9FxGsnY6fkK8rpWwzSL1s8H3j5YHJpm4lnhOpLP+kb6mbY+KxIMq5bSLV+CjmDn9B2Ky/1vDixHGeq9vm5XTqS5R8vllF6IYOrN+GiPriN1uyG7t9v74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347082; c=relaxed/simple;
	bh=aI25nEi9VQ+DRbhHhvdWFYIwKb2dX/WGA5UFAotTP7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vs9vDlPhol5p9MqOA0PhBV8s9nSsUuW5+4eOt9Ox8PtrFoMjxcz2DyR4S3BGHfaQtmhzhvDIg5JXv3FmCc46S5rMga0OqTqY9OvXdqAFv2b5uOw+GbX2VBBaYBn1guEZjVV+ZHk7HO+Z372ExXpx5Gvfu7y54uCm7wzeJc+EgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ortdAvMO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ortdAvMO"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7b4ee3a88e1so33629007b3.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347076; x=1776951876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5R17ZLDIA+FBJrsZkOSCOpWtAhdlsU3PoFA3MU5Wuo=;
        b=ortdAvMOHjNZzuwXYaOF+MpBmGjA4PYIp+AcueYVu02wYaZndZD8Ac0yiBExervz/e
         r1hbnbLDc18OL9YMEugpCk+bnSWkb8ZKQ2fPOEl6TdDEK35H/4xLWhLExxLKxhxBwR0L
         McY7HLTS2vAAZbtANuL24hb01lXRpWCfagaYvOFTwyiJZLDJX/fVep+fJFWPyWubNIah
         3nv0DeukozxPVWHexBTvDNRGBn4XsM7bN2sU6gvttsoZ9Xn22Z037LyF03qizAESH+Ri
         qHWEORYcpKM3oNHrSUCa0U6XTX5dAdNWfXRROcRwPMlOGOrz/LNfhwgK4i+EO80M9/sv
         ZUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347076; x=1776951876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5R17ZLDIA+FBJrsZkOSCOpWtAhdlsU3PoFA3MU5Wuo=;
        b=Jdzxe9i1enCTP9/ZddoQgF86nNFL9JILyzcxnNLUDZhQAqTmsDneQufLvYxBquR1BA
         ZfyATPeIpbcGUcAZBme8WXwDgAIPqVMrBWOtOxUnod50cy4nXcylyoMhTugtjUXRayIv
         PJ6vWt6KMncYuvHVtQuIzywV4IYKR+EcunTIJh87JHRHfpxWeyVREJapRbOwn8flY/lW
         tEt6GA2JkhOAdFC4ygu1Qe8x5JPUUsJDKUNjAseE6ITkBkCh6xBZxTvhBpJ+vA0pTQvw
         MQK6tPKyXeDG+ceZGEzUM6pZTpRW057LXD8A//e1rXqKOsDfmWXCHJ/PcPG1yWrL5PpX
         aNrA==
X-Forwarded-Encrypted: i=1; AFNElJ9kvg679bKMZYfqo765aZv+rOwsurnbje+OFuDvaRxeskAHsThMsjyH0No+cCDSsROOZucZlGcqFMYXQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgNkz9ivMI2zR5pSw33iLNaqev5KAxy9VU4k2Y4USQH+gMrfe
	srM9HvRxN1Jv0kFgivsm2sYqvykJ3RMwRoLYDDE4A2n8quGc20Is7zuf
X-Gm-Gg: AeBDieuLzKgvrmSn0UvvJ60wW03Jhj96XXSDIFeXgTxkDxCVqGZfGash7RD+JmE8YgR
	y0+jRE8+BgvXV7jWLRx66Qda7mZEeWTLbDfK98B38K+3mQYBzPS9yfU3XbvfpI9+SUSSd4Z7Jjt
	4tHqSixJqwfzVz8BPshNq2fvUtoArQJx0bbYif2kmQeIK2ygMOLxyhm69iQwaZU7UbzJDRO+O3D
	OEHS2sf3wiS9fcxZP7M5Z7X68PlsNRUlKj/LzpcK8NF2bysnb3w2Z2MgO6Mqok30kTROvwc7ppW
	yWb9Fp/exwNo8SH0sdy12NQSGGvwmI5SSUL+eyczy9xov2q5YEWZtawIdczz9Iw4+2zdDsPMPlx
	8t+ow9G27kVfQyIlzeuXeaTN8IAsX6u+v/GRfKOohJYbqt/TpvLJXb996+TbjWkWE4R4cXLCJo0
	ifoj6AolsRASUiNlBYmbobK/a2+ncEHatyQidM
X-Received: by 2002:a05:690c:3481:b0:7b2:6177:2acc with SMTP id 00721157ae682-7b261773862mr189577217b3.46.1776347075855;
        Thu, 16 Apr 2026 06:44:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:53 +0300
Subject: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
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

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
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
2.53.0

