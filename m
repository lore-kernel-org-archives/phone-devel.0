Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF94219F3
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462090; cv=none; b=mfpfGW9LH3LWXSHjhZzJjP8XgoCmdNcHBqrVCsnYX1QGJbqkv9+RB4PDyjLsu7YUmdqgzf+AkuKFwie0zmPkMvrhHWp+nbG3uuwy8+Ua3jsfATc6gU/VUyg+LMGnQZiIVBFiy+RfS+kZ9SCu4i6v3cRkjOwXfqsZF3F3jiRUu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462090; c=relaxed/simple;
	bh=ftZgdg7K9cKg3ipMTIpEbbcSpLmeZk+ZpAf53O/aSkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCxMzOXztmaVrPgcnB0Lvv/EOhA95iJa91VwQNgkYsEJZVoR4K9Jh8KebYeQWD6yHWends1qEarodJAReCmma6sSicyjOjF9n4YzEJzXQDXk76sPS4fDp+BTaZVTq4gZyc8ttIXLE4ahXRdpduIA46bb+hehJR9uXKA7U3L39gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTfOEKSa; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTfOEKSa"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so579280a91.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462086; x=1775066886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbIRSEk2LdYbfaQWCzoRStNOdJmdBCZFQd2oDD6VfDE=;
        b=HTfOEKSa0UsVi1IyeIBW21dH0CkWnNyCZvtnpCq64nqTrxx/gwBEeQEH1NgOh69nYk
         iyuWqy5g1EYobSJabk0ZjAN+B88R3BvMpts9jTANvOi6RyND1201G6Ooqwxsu3Mb6iXg
         QsQQ3ovu6hWYidyBXsBZQKE2QTFxy6lcbY1I9YGL4Bd3+LOzTST8WGs3Z4QY30Cnffby
         RxfJcOPNQBEGD2TzJqnktjdexcVNh5nJifoUTFDPn/8VseXvwtK8/EEJS7WfSVVpK02n
         oCNZ7Em+9lHgD+C3WEUWb3oKvc+zVb1M6tQ0ilN689mkpMtfcfalZz3OKwxcxtQDDlSc
         0xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462086; x=1775066886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YbIRSEk2LdYbfaQWCzoRStNOdJmdBCZFQd2oDD6VfDE=;
        b=JVwaqc7j3pa9ZBDDm5p2vfeaohWUE2eCoY7GoaNTv8GiL4gIqUF4q/4FhPPWqLmhrS
         eXM7cNDlKfFGoxns58Depr+SlZtRQ6tm6HSa28ks+loT+hbSnPTHzUM64mQ30zawBsTD
         zaneuNPnZzA25j32eAwoVRthst0VeqUGS6AotUHZrYVhsezH2pmIq5ca63Tl12yOz7Xd
         5G9KymcbQ5GZm5Y0CzBCyC0aALDO2sbQ1yco/OVejxBLQZoJaktTgc2rAA5RrXmsFSaS
         hkMXKTgZv75bW7ThX/eQ7Y19gqUxBVkN0CdzoTcJK5MVHRtHZR/M2PHWLnpAMORfHoYk
         BH/A==
X-Forwarded-Encrypted: i=1; AJvYcCWGvMH0He+qLT7GIUDcZcnXW4IHQMGIgFeUy3pi+HLUSQFJq9jvHBNZb0yMlrXx43OMbRczaIQ0/1MoRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCK9Wd2iWur8rgeWm17z+9fFqNAyuUHIt3b0Mx8K6uNlRZYb5Y
	7Z2VeBmx+TGIVW0WE7uMoNfW8xTHffxPw1X//KdcRSTnVRA+5eTFDQo1
X-Gm-Gg: ATEYQzzCl/qC0opwzJxdtOCTO1YX+Eee2A18sFFXMjr/pRJDtKAfrdXo8BhVFIMXAiP
	FvDPFOlku8FnRTCksVg5znLlNiuGubioNHajGtA0kKy/gOHfyS+/14di1xjK1eaLmTr3Am2Utpd
	ztrG6OuQiY5X4+giVeSFK9Pw4wEC95PrylXFfFEJLyPQIqATc/+xq4H1N5BwsZa9c8EQQY+V6sy
	FsSLRSzANpVmlC+lqN3F6OZXkvK/rigXR+ArEb5ezezEIKmXPnyYuKmlcNjkMHRdqmrZ8I1LrX9
	DvTufqvAiJr4vWaP4Dd+WGk4NXElnAfBL5Kvx5fvKZ+ckrtc4T2fz2hWzdwZ/w/Ct3Iehbi6ZbW
	6utDnOjyiEJq+lHeGOUt73IdyWVjWy8bomAjWVCgFu/cL2DuJE4UDQUtO+c3QuqBV+fpSgNimLd
	B+y5XCplgs2fx3EpxH7YaJHh0KooNT
X-Received: by 2002:a17:903:acf:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b0b07c2bf0mr45862795ad.19.1774462086431;
        Wed, 25 Mar 2026 11:08:06 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:06 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:28 +0000
Subject: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1197;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=ftZgdg7K9cKg3ipMTIpEbbcSpLmeZk+ZpAf53O/aSkE=;
 b=xZJmCgqXcGCWixUEcWyXsMJDHpUeq+hjuOchlhVJEYjDrfI+FLSAHAJs+YKk2IrxN+R0oUgyd
 2w1srb4BwFjDfpikffzIsB2PCvgsmYpunChKq7qQ30GMdg8Q+NdoGm2
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The IR transmitting LED is connected to SPI8 controller.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693..7d848117317 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -99,6 +99,10 @@ key-volume-up {
 	};
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -160,6 +164,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -332,6 +340,18 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	irled@1 {
+		compatible = "ir-spi-led";
+		reg = <1>;
+
+		duty-cycle = /bits/ 8 <30>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };

-- 
2.53.0

