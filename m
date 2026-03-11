Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7A3DDDAE
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229106; cv=none; b=dKPwfiulB+4ufhLXNee/8i3UCoUm/ymU7M+DOSnUAbMX8G6FmaGYB9YbiUDuFv+wI0mFtuqsMAId0sDdlo055KdUqDIBx06xnongisO64sj8VYg2bS3oSmY84+TxDSLaI+Pt64fQQSStY16C8Y1ARmb2les9jZN0w8FrxWTrG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229106; c=relaxed/simple;
	bh=2iIh6/jj/6H6G9sjbI72U6v40DlA/kmaSOoZzH3A9CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8SYWIztwJgnfmH1xmm2UEmZtUhpmj09wn9RQi8jpX2NuNr4US8VVYQ0mlD4YOBNWx3IHw/9f5C8X+YRnP+7meO351iuezJSCBd0VVcAH2xWtMs1F/9H2wj0JjLCFlfqCUca/46dGY35BGgLWWlLf0iVJCxS6WMs+JgbEpJ4dcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeBt1krK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeBt1krK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so35812205e9.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773229103; x=1773833903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk8qVbjj9bf3D7zS5clldQ8atXUlML3S3z10DBlLuFw=;
        b=ZeBt1krKhEnfZFyHZJoA8Se9GBzjGuv9GTh+GbF1YehtebUytaipEJhQJl4k9CHkp3
         AFDoj0uiZqn/i01mCV8eFoJY55y5An4VAslB1Q2eHAIKe2QIgld5nY/YnfkLFreBeNFL
         G9OFWPuX4ZAM9YXMmIzqyTDVHTLBi5sBloYY+euoRJqOQQ+EC48tWSBSi7nsBW4tkMPm
         7BdMEML9c456JHaJ5Nphj82FmD52TrKpIGFcUn2ggDcOFUoumzbnr3fy7E3/bpBLasAy
         7q8LLkpFyI4Ji32124CrtxG1qOLe32iG6Ka8AsjttSghrf23SMF3IavZx/YPgTfN2fbh
         oqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229103; x=1773833903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gk8qVbjj9bf3D7zS5clldQ8atXUlML3S3z10DBlLuFw=;
        b=u2BXq9a35DwDc4f0BNzz8/nleB6FYyB1EKogIqVupal29zAtP9xRvqIU3VDDAaoQnG
         3r0L9fEKZEqIRw5q0QtsB4Zed26LcPhl8gx+B3MaDJBczt19ynxFATk0x+cthaOyk7tL
         7USDWhD6Q19T+oYaAw2SbGizqteWXjAk77n0Y3KJ7Q9VeIkRT/Vj7WvOfDeprovY3cvo
         2gtN5ccWof8zUPF7cBcfj65orn42RRL5ranzRCtb+s31QTEIVHEvejxUFRN1h4utKV5/
         2lrQXQZO19Ev7wc72PH3KG1t8jDUmkqvF4PwOkZLSXyt/h0rCVcSMfzeA8xFu2XxLElf
         Liyw==
X-Forwarded-Encrypted: i=1; AJvYcCUdiUG3F3XlaDG87y6qMQbv6/FP/vb9amandsGM13urlOtLZwTLLDO59M/VGnECRpL2SggGTvzOhU0gdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwNaEcqDkjJoh4amwgnHqFSFHy5Uv8kAHcn70vRaEOSyCb5QH
	J0Cpu9rAi0ahRqd1YHjuAKL/tXYA4zlmZE+pt+yReJ522TkHJy3uiW3MvpdNkqkj
X-Gm-Gg: ATEYQzxMQMZwpau3L0nxOhdyDDJog2cGFqIZWnbBsaTBG68sv//WbOdBUGwKsJh6ijy
	0VAx6F3jlTrUm1fmnKTMdseQX0fIsjKaCEn29lvD1Q+rPvG5FlMUSymXUUsni94UC/tFdIGkHuU
	OUXlA1IlGbHAZuTqDBwZdfyknjG3aQ/hvYL+leeBuvi6pg7jaobUYDLtSwkVSlSQ+K3zYIUAMYG
	lfIh1mb7UVe08zg+IIa+rHlbRBAQz+qTkXbJv/DoW0csnM8L4+pBczcb1vZO8fbN2ORHsSBzlKg
	hhrYiG5TtKQQ38SeNziu60N80LirwCZWmzZTEFBzUp6xMkrE07nqx6Kuy1V3/PpbNgwEMlCFUwG
	YRSCJdjkcMWAFU4HTdwWtRMhZQesJ58ygZkrxo30m77+9/GIMTnblf7qRqYCX4RIMkgOKUZKXvI
	xEjwAaUIzpBr9RNU4c/s0k2ZBz3Q==
X-Received: by 2002:a05:600c:8b13:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4854b100d98mr40593355e9.16.1773229103182;
        Wed, 11 Mar 2026 04:38:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm188681855e9.9.2026.03.11.04.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:38:22 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 11 Mar 2026 13:38:02 +0200
Subject: [PATCH 1/2] dt-bindings: iio: light: vcnl4000: add regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-vcnl4000-regulators-v1-1-66b6038ce563@gmail.com>
References: <20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com>
In-Reply-To: <20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This commit adds regulator properties for vcnl4000 ambient light and
proximity sensors.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
index 2ba4d5de4ec4..a1b4c02db246 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
@@ -33,6 +33,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply: true
+  vddio-supply: true
+  vled-supply: true
+
   reg:
     maxItems: 1
 
@@ -54,6 +58,9 @@ examples:
             compatible = "vishay,vcnl4200";
             reg = <0x51>;
             proximity-near-level = <220>;
+            vdd-supply = <&reg_vdd>;
+            vddio-supply = <&reg_vddio>;
+            vled-supply = <&reg_vled>;
         };
     };
 ...

-- 
2.53.0

