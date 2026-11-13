Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585903;
	b=DcynpoRtKM0fh7SAZVGw6uVkk5wWMIBSrgamxZQoQRRucvLEot/b6tZ5J3dF74+p1AN2
	 0oeknAlwKOnPTed4Wk3zS48KE8okX/fEc/kJe4afhWTRb7DEbiLUH2it2/ugqxX+Kkiek
	 4DlV7PbdUOnKl69wgkSZ9VgIL5G/B0iN5L3rtlgQKg2tG0vMeezNhHUiosKZMBn3C3H65
	 S9NuEDzpN+INE51YaOe+Cf+knmm6JP9yyNuHFFUhXE7J17iFo+dSfXmB2QbnpZ2Fhwo72
	 gc+bnA+apg6gPHnSBLdifPGb93NsDTTSYassIAjl6IFR6eOLIL67/iphdPMklj4Wqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=VXk2AAqTEMKLVl2Jyh03MaCh1bA5tJDBOFz1aBBLp+iRgrzTdNrdNLRZYgkvL/G0Eg0p
	 o+xBBxER+667NLVflZ6sWSJoW/CluF3GXa/YHEffDxe+Uvpmjkom1wPLdDku1VUq3CzGs
	 HDkNGZwDAq/Sj6y9/dN19Xy63YcDlT3E1mgvLUb41NcMH102QmnO1q6gZWSnr0OeDnxdR
	 KHaErbBPh32O21MeSnxK3LV3VlARhd3qOZWlhilU5aepgcX3mbA6x8oduKMUu/Mbu8/W7
	 +BtIfNYmgGW7lFLNxdYeEpyrIiwbjSiVp3U9YazpVhBpAuFyllAx5LZ8Na64pxzbQ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A66070948
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524A66070948
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so2156474a12.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585902; x=1795190702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=NXWuRo4onYFiw2I9QVxX5OPcgg0tUYOXHsV+WLZ1UsLq8W44JTs5HZvfoNvfPYwfqZ
         aVOf4cZpXSmdau56AKXJsV6WLFeanx3/L6Gy6RdjXG+kl/zXHoy4cJaHlVW/zPs9kBuO
         oemMwQSPJYV6h+bJqG1F2EHGrXxt0dOlLnWgwF5Ulcpq9oM3p2swIXKrikcx1BuL3LKA
         qkXPq+g8+NN0qbt24tDmj702nIBntuPk1JB/r2+AInsFcJ5NXND1Shy8zA+xJm/itwf7
         6pWUpFjQRQUasOfYu6ayS094qOl1VpxnYcWG7zeE1bwzTUM3WF9GOAAo4Y/Fbxs7+9Rr
         ydCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585902; x=1795190702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=Wz0aapGJEJNZUexm8pKlSW99MqcGpwbTQDvhv5w40ltJ64twxl0bWnjYsbQ7/LPuf8
         8pyB78UXWh0jcdTq0vLbmOlChk/Dgi2JUmysttHKBeLnzGU8wWZpnpfseJHKcXl2hYbf
         r1HV0DNL7Vf+oqFnKsTk1ewq2DAZSPqXTYOohLBwrPnCZJ4a1WE/9XcY7kSdAVmWA0PV
         1Rix4anjsuHZ2L9bo1dV072zPbVK7bo1Md5obo9lY1k1Xx8hGiXhxIuyqD/DifktGdEW
         91clKqL7KkbFbUXA+v4Mv4BM5tTDWJsygFx+NVbe7gO6luinopYPW885p2eSB9vKJ/Fx
         qErA==
X-Forwarded-Encrypted: i=1; AL+hErFRDvNBmEuazR813VUcj6ebXWGACU8ThoCM4WYUPyhiHZIBdokUrgws72Mu2WQDF9odFgeEp8HcESkZzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XTteWCl9ijWBcW8V5aJbG7sT7pHKbxGQqMyYS80haSRepsyjO
	nxYoXBgybvjQB+Nk9qkoHJhCl1JDA0HPk8ZKIX81hoWHsFngLz6cqhh9NX5OwGR6poM=
X-Gm-Gg: AYBFou2pjddZ3GGa1+akAS4n9DAZZWK19ulH+4TCKXpBuGiF2D33FGQ3kF8WKL20HJr
	pIww8amXnc+FFam4vixlWYgOuwYi91Hn1LKgX/1wty2TWO1GVn8R8WDUANT9nwK5Ecn0RbTRHd5
	8oh1+FHxeWeSqYSnJeK0w0gZU1bbPek36lFLIoKKxuhyBJk+b3zdgW3y61W6cor1b/ZUgm7rEyM
	WUr444yaPc3p8P1G6ERT/yfmAHI67DtWagz0RJ1N+0pF/+hof2czGSuSqhg38wRM/k2A2DSsBxO
	bsRfTK1wfNQzzHW2yYvX8Xo0JFBEW8hcfPVXxeLyRQR2ew5L0rPWuQjLUyG9ONOrEhiezXSZFUY
	biGdhWda4I2YG3AVu0ogXILpF3s+4D50IAluHH9SJBlHGnj8+3WMy7xCimJXPuUcgtbigAKRYny
	ppm3Qis8zqmiLvjgrU3ejDMy6evdPFqt3DJIkKkPoQCYcHNSQTA0ru7MlFnb9CKAmzk7KmpRcqB
	KbVEtW3nX12GjLRnR4AEY12/sPvD1DU59RYLmv3u54FXmBym5ug0vWfSza3bw4yc8+suKK4Vh2t
	NVjnyCqXRbJSSpdAnETh2CWOfekDC+Ig2ysciz/8W934NBvLHJyVbP1GYTjEKGD+QBsniVSmUIx
	CZiP3Lx4=
X-Received: by 2002:a05:6402:c6d3:10b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6b7c0c1661amr2023087a12.32.1794585900329;
        Fri, 13 Nov 2026 08:05:00 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:04:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:43 +0100
Subject: [PATCH v3 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-bat-temp-adc-v3-2-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Ht22iLsedKZL83BN0JDY5PWcB8ObVo0t6BTxz26Nw19xpDmgxebf+ud/QHUeqUQWi425ecQ3+
 SxCjc8QTNEyDHbneK6kZJZLlWO3P5cfHB1Ugyxv5BwyqSTZWKUV7rxS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

