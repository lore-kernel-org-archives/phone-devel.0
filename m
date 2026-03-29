Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5F26FD97
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759725; cv=none; b=dwaYeEixcDociJ18VPrfWcRuy6FUUhteJVYR7k7b8LzzHqseN2xCFXzhzDV/HndVKX4KWf8M8V+031eMedXVGVgOwk67AWqNDqXGmHaBVF29S0EUl5ugRFG+qpstuTWlQxpX1fo9UJh54+5mHseO2a9wmdTKt/E2uPGLCOd2Pu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759725; c=relaxed/simple;
	bh=agGtf1ZaN182+ObGaLSh0urJ6qEhFK/46uOcaat6JdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekpJhyICHyJUN7y6juCfWGbhAH6Vl0GK5YYC3mWObS5okRtqE4xQGSheyHcpQGFSIUJieUpY8pq+5Udk+Sg6bIHoDApVBcHgJBJub9XyaXHuOkzoXRLQDSEFhjoZ7bZd9PWzvhdi37TgOL0VIJPit3W5rproFLYzurPBOcGyapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cfrb8t84; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cfrb8t84"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2398092a12.3
        for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759723; x=1775364523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzjNjIV7vs7F+0soFOjYF29xe4CQGuY95uYaL9NvZ08=;
        b=Cfrb8t84GVzZSR4Lt1kRYfO0ko9FjSdKK4Ei9RTcJdVmaKiWeCBDW4t8XP0LXcyErp
         xuybftdsI//cUrnW5uv9tf7LEXQ8fnlyw6n8UQcCAMvKy+fbrm6wzfqxI+ScQwGb6c8/
         DsLzUfZSmxzf4eNmu4GIc06+/M4DSLODrw0HKvpCbyUjGd6D9/ISKI2nRK/YCUFZ1j1q
         BD+1yaRvJ8XQRwp1wxjyONkDrwn5WgCYNGVRSNVPrVJalSNEb/mEMGDTNMi4oBBuCc97
         4dmL50ZKHfa/TRZbBd6lglRvwYcbddAouehyNfSs7UORZo+8HoiMoOCNYjfmd0A4Kyp1
         9QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759723; x=1775364523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzjNjIV7vs7F+0soFOjYF29xe4CQGuY95uYaL9NvZ08=;
        b=Usb5DqEfynqKgjPBe7peTZiIMsdAyWqRZhFgJbI3hnD/glGsWUrb7VDWC4csZywUKZ
         0GyFXA1d/INULS88iKfkgd31D8JBFBRrWzEOV8UDi58JH4JM+obasPPkv+aMRkrDzbJG
         yvm4TwykyQ7mqYgNEs+KaUq16UrnFK1c6lsaFkEQO+OzxA9u48rX0fSBWnCE7/86nJkW
         WesWE88HNewxWYwS7BI2/WSwERYLy8PDlSTwKOUkZxkoxbTCBLMO15RgXW+sMVbP4cAM
         gdC+QNnIIxS0t1K6OhNdD/5Pqydvvo4Y4gO+Qv/4p5MRmSxHfZeOR6Rnd8fMXrVFfx97
         1SFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5iQ9lJp62eVGnf5jNtueqL+2KgahaWuZbTSQlh5pH0DDPZZ5sLETji3wBQEn1WZwieHl7rstw2D6Ryg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcanMUMlQT7oaTFeu/a7B4XFiIy93m+CBlebzX5UaKrcIZlMdX
	PPamUBeKPmaesyzDxjtUDbZpe+34cHqYGOT3qKz0eYiMMCB6k7fhMAeE
X-Gm-Gg: ATEYQzxA/e56z2sFLRgk7rNQ6CjgiUFoJHZaOifrQVUQf06wXQiaPOh20+0tSw2LmM8
	jKDBa+PFv2FnaadKriBtgNCj4gwzNqhZNzqMiA4HO/w40ptRssyoZiKpYOqoJZ4kmJmhreIh83U
	c8vKLXZwhXL9FN+yU7EzpwaaoXzzGcqvta2XfjPi143TqHcgyzCGjr3WwhFQnl0s7uIN46AEKjL
	rrXV5VGwmE96bE1xOvjfr1bhb2xCMMPqjSUjR9h0G0atoi9Vex2GU7aaAnC2A/tG29t4loqn624
	3cCGzfjXuJ3O30t6kJqLMbW26+B39rrNd7nku4U8GWty2tNCFAVhV1eFtIlcg/uOYZGP7OLqkEJ
	SXNdsrf8bSt8gK22TSTPXJPJZiKifQ/l0d3/FU+WV4SfAHLkLJ3638x8VUqicIMNQQ/jcZOpYY3
	QOqKCtg4U4Hd/2wws9PApTrl/m8Dz+
X-Received: by 2002:a05:6a20:3ca3:b0:366:2341:4980 with SMTP id adf61e73a8af0-39c877ea3b0mr8236099637.11.1774759723299;
        Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:00 +0000
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
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
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1331;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=agGtf1ZaN182+ObGaLSh0urJ6qEhFK/46uOcaat6JdI=;
 b=utg7Uwku12WE374EulRQlObbGDRvquq1XC3xzBT3xs7T9PgEdTCMDHi0vxob22zpSO8m2qXKN
 NaI+fh1EoyTCxSeMHUAqZTybPYpieZFIj0B1IMfExt++r4LaSQdtFnj
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a1..f66ff5f7693b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0

