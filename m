Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C83C6601
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865702; cv=none; b=rfab4a7F+E//RsXQpbal2AyQ0y4pnZShA5lRJzBanCKBWguiH0rB7BcHjouU4DN7Z5yk+FJKt6hWLx14NKORZGc0d/d6/hhrl9FRx2GirKlQSGs93m+BIpf+KK/l1gQTgA/wiQ5S2W/wrAk8bNWSkXTgc89nQPMQxtA+/U5alxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865702; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbKEUEUeAOCq2n2GeucTCDmNvOemu1OMxEX0CpO7EDIFr0hUzye4flSoU2wCqrFlmjnwRrGVco5PE/ArquO02YSaY5g0N8njhRdXpm+TeGDTU8ZnzGYML93+Qs/fdQIgeUwaWCDZS4FE+0u37J8lpmpiQr3/CrxihlRn/vR1dFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7PzCdQK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7PzCdQK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82748257f5fso2803721b3a.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865701; x=1775470501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=d7PzCdQKI2FjXAFhI7feJnqgEwLAb0PkUqOEuLRa44GWKkPO2uVQL/JeYHwcpdSrO4
         uhcz8YMjGejFfGF6eQh9AAWK6HABlXgR7RtYRZwhm3WhUCRpC6gVuRu1cyzrN3OjZ7ml
         VelI8XqZICAe+alJ8AlxexsyEmBkulELss4947d/ozuO9IdUAUj0lskQBTliNyX61Ydt
         Z+242OE4q5L/nl/7HAY+H8L6KzbSLW0PlzG5jR5XdHnRa+cbyprzDGWBMHkUwY2C0+tt
         xGmzxMfQbSFTP0XpCAa2yVYAv7PW1alkVSX5CQyEY3RZ8NiS5kB+PWaYxgnID5aJ18Fn
         khSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865701; x=1775470501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=cbCsPU4KXRK1nbQwU8WCoA6ACMeZ45H8u7J16ubF98bIzSzn9ELvgEt3vyi/oM8efl
         HooaUd+hdkjETD8ikJeuElZwmbo46gn+OGq8ypRqu+bkqCB8boIzdAefwhlNn8GHHEm3
         dkkYZVlq8iUrYP5Si32z1M81eYQOzpXh/ef9cQADMztPjbMCneM0nDlGfTst6lpSQmfn
         aGAw3XGIchAJtKJAbcBCjkN0gJB3AFgFKs7u+XQw/fBlVLlklo2Xb4PhsSMuJmVEesJs
         O7xXkgtZvTd9JxihyTf1Whz6GGkNQ9L1hQLSBDoasKM5tmTfA1EddSuqoGOobCkle6FA
         xRPA==
X-Forwarded-Encrypted: i=1; AJvYcCWWSZn0CxAaIojvgxqO00cyFJ+b+1NOxkTfzRV0BAgW4rWPgnlQCLPRIr55YJH2rm89We+kSG8ofHCuOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS21gdWCyojwutwXd8yfCINitLogX26kiNUBBPQC/VXK3OQD8M
	Jd6hhBwkQnXKfzavR4yV7lo80VbBupEhaA0ReWQpGN4G0kVHuDRr9JNL
X-Gm-Gg: ATEYQzyyzBpfMI6rVHzkfXJp986LVZLDoS9FEgojOT+MW8/QLsiQpsVM/1DygucWuos
	mksUnGXKOR6nzkJVmG0S2D7kNo/8y2JsaOn/c/R3PJkIvoS3gzsyPJY9H2JCz9XzzDrnL9WUNNj
	5y+/r+0ZvXGGfTWOzZ3z3jhT8YTvehG+/ahHF7yMkzbrLyWLaP1XpjpierE8ccK41yx6tgpbs4Z
	heGAujJZ1stq8jr3UYIRo/RogTuxvIFOzKNAJHUOGz6sIxzBFrDiSiQJlx8L7JwKbTQFq511mSy
	kchSuZlXycVWWMCZgHL4JuH+hB/Fiyi1SdkvUskW8d2PtCA9F8bn76WYPLD5fKcxtIvd2MZeaaL
	2cX0d1ewjxBbgFVgV/bs9p5WvX3thHrvp5LzHbtpePiFbScEO2gWVLjNu0+Hq5qGUp+3GpEzlXd
	gkgpio/W5ZV93ytQyeJFCVONnEVMX1
X-Received: by 2002:a05:6a00:1c81:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82c968762eamr9218652b3a.8.1774865700537;
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:53 +0000
Subject: [PATCH v3 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-6-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=vESfFUjfFGKmOK/hDu/HFDuHjmi5fusU4ve1ZmPLbaemgxTmnuwyCQLnQCnN3/xFqngqK3IT8
 SDrNOUspY92DbEZYsp20mHxibSWyg1pOrifHZHZrcDoCeEbBzoQ4HKT
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3e..0297bfbb2750 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0

