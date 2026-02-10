Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623C27FB28
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 03:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770694782; cv=none; b=FWidPVs/OffNag+rHZqEjxfyMTYN5KBqZJ76QjmX1TbgC3Z/Z/iKK8FsjESvpumrsY5gv34svc/n1ScSaDfEF09b4NqG+mAT8vosMr2Odvrcb7UijfglokuTQ3Iy5NV7uwhfJQNOMc7yKhuHRw4OCzEwVnG/6SKxm4ZLzpnY89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770694782; c=relaxed/simple;
	bh=BGFbjAQGLZNXddJ7Zbnf+eR42ONlD2v8hRdM+CSNiEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHf3YIYv9VACBnLqSMF4tsbBLCdFDV9HdsUekxrykebJiNjE7wByRUUfi996j0mHW38pkEnKpQcLhJ3VmUgco+6bgX3XfNIOLWIj10vQ82m6tFNl1DjyON7WPAScpoaFvJvaeihpQj9UCKEt2Omx3as41lIsbw5S6t2ngUNoyYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Col+gTRn; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Col+gTRn"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1248d27f293so886361c88.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 19:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770694781; x=1771299581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=Col+gTRnlK+mTSOR5YzTQl3dc5UxXngZK6SCIsdK3MXIp1znoRiGJk2buaW5CNhT8I
         zT1M8DHmAzhhTyDjlbKU2UHWNdTMBJ05guWOFvHaUHdzYdDkFF9bEdeiH95w/t+iyqJE
         UQPIydLCIx0Gwyi+eqCS2hotBkjZ97OTma8CCMJwJVfSYfEzH3Cx1bL2T6R4P2w5L2hv
         5RCd5/AKpCk8I7FonAf0UsDH1pJO1wqBPNKOl6FF0rR8v7c2T4nxQ1YGQtkU+hwlC4ce
         FvlCTNf7gkr+uPrTtoBNQ1qnUhfrPJoGBzcHMe4yzj3psz2OuddKc56TW/Cg90GImRCZ
         L7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770694781; x=1771299581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42/v/aKtXIsSN3fGfEiA94YbSmv523XY3uYLKo5rl0=;
        b=RWnwA2yvcuUa1JXUKA+AmKEiFK5VVC5+8HRf+EeLitgb7OnZtFjsU0UW7n/IlJuE8T
         QHTU3fQPOl+4MNsK73xydJHzm7TNZ90XK2UzWmrUTXeX03V34nANLy41XUB6GAkF+bAY
         V6U26bc0ff0qXaJw+HOJFVqznOHVFnOWVr3/3CSmsgcRJruvJHVY6aXcyONiAtKDZfRC
         0LQmhTRtXnOA9i6rJr2IXD1A0XhLvhFBPVnQWY+NwzZ6BkdS+iirlWzrRndO4ISvZBMW
         gRcSvs+DU3ZktFuRo4PGw321DFgjB4x+APBM6LWBPjey+Ha/e6XE4LkU9FKe78gHQodo
         hMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEMlR1yjaAYeeXgv1lS/rEukh0F9zZAtGkkjiQz5KdF9OFjIqLVCAyylPCbUVDkLrlP9RYJflIsrtosA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJXNR0+hiBXrjZ9Mlt1knewjSzdnX1SyV6dx+eeZNJuqK3eNbf
	EtYF99+TgXIEr/gr1EO82BlA4ojHINi9pbODsbn81ZkKomF+/lsK5DvorgkbNA==
X-Gm-Gg: AZuq6aJTUNqH+R/YKrMsxQ+9Zs0rq6p0p3ygkMacVde2332L2V1crSAjNZilnc9JgL7
	+B8LegXEzXiIkfYbyKUZFqRmfT4c8JYX/msVYq5OyLSNStj+aNkeAHiDK9XDIVViKSEGkleKs5p
	zGLIuqNlJAyuZjEUhafgtM8TgJrzEb6eMc8uFaCakZvyIvxQtJ0r7UV2OUt2YI9icAyMbmd6az8
	P2QKEqLBCZ3G/xfAn1mlZ6cJPTuu7qb3vvZyZD9/jgyyQ3wGZTakN0e0uv0+dFlngmnZ6PdOK9V
	KEXPmnwU5DBoXbX2mCI2e4FM3pgmLoG0qO0xXkDxkoShgKK71+BGIDxsQYa7XgzJqNxf0PmEs92
	4TtZ/H3Ko7wSzEOzqXy222IhdBfAJaz3nfyGqkI8XWY0HyO5Lpjc7AM2O9hoUPbu8Ahbg/liuee
	boZsnqk65BccK65sQgZ/cswslCB0OqXEkNmleZt1IQld89CQ8Kz+c6BhzvG3qmswr5XVbw24UyC
	cWpq2JoG8W67S4=
X-Received: by 2002:a05:622a:143:b0:506:1f11:f5ef with SMTP id d75a77b69052e-50639a19051mr189985021cf.73.1770688903651;
        Mon, 09 Feb 2026 18:01:43 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fca0sm89313956d6.28.2026.02.09.18.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:43 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 6/7] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Mon,  9 Feb 2026 21:02:05 -0500
Message-ID: <20260210020207.10246-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.53.0

