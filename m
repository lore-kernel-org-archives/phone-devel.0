Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5428726D
	for <phone-devel@vger.kernel.org>; Fri, 10 Oct 2025 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095435; cv=none; b=Rn12kV06ty59SlgRQPREDLq1iywHluOTZIu9w6qQ9PcjAeZRC6kR8y00ga+tkEO0OlLJam+n9z8uBM0D4RyFUF1e5p5NCKk8iraC/oA0JHABASw5nDxu96PyfXZeHQBRzgswM4gsOiqdzdWE23NGZRZC/jF79dxgWuM+lwinzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095435; c=relaxed/simple;
	bh=rN2PnqvN06c7mlTMsnkt8Ofc5TQdsHN0zxf8VF8tMcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZoBTaYf53TUZ2j1YSSPl20n7sfc7JuMfj4CFmD9sxr6uNB+Or//kYBBFwskF/pG4bP7x79A5LBRkWccYoxmf28mDm/s+hQo2wUTJuB3CNhGBp9aEM7p7Llxrl/zLNs7Ab2NTSy4bUzaBS09RnFk+ZBTM+BcjmK9ezZ5GpAWvjdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IO8I/tT6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IO8I/tT6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3da3b34950so319885066b.3
        for <phone-devel@vger.kernel.org>; Fri, 10 Oct 2025 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760095432; x=1760700232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjZxwkEE9XRYJeGqY5P3ejLLsqggmj8GPN1yD9SWCBg=;
        b=IO8I/tT677UDmGKAg/r7kbHtMkKKVyUpY6sWKWZd9EcX1j4LEKMio2otyjBDxr5KI6
         HvAGguJvbwiC5HyyUBLNW1rMqrME7xvin3O7UxbqKO48SFGq4xCAbWwh97SkFhHOITvv
         Fbd4WGx2flJDFor0BXHg8INIyYvEhthExvfdaZMob7j0XpeasdD9H+mcpG/7FHLCYIrD
         tVeGm7Ybm7K2oyhBnLXOlnDLy6fcCtDElLlVTzj4axBdqx6PzS1aLP+CYDoz8oB7PHtB
         q2k9DgZ3WRA06muim7eDprtazKIraT6K9YesmJrJm0a9hWOvdUFtvkMEzsZxZuIIGKz/
         5jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095432; x=1760700232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjZxwkEE9XRYJeGqY5P3ejLLsqggmj8GPN1yD9SWCBg=;
        b=etT8QjUohskts0J41qDRH21KaJtT47d18DHknANy1bOQh0duW+vcIW1bx8b1xiwnGE
         Do0Bkmil7SlWE+/u/4XjpCZA74MlsRM5jwU8l4qeZdCkBTDHwIc6+PPkhGvoGpXe/Y1w
         UG7corTtQJ+hhQdmwZmWZ62DjVvV2Hgpte9dBidGEq1gdHLQ70fUHNUCem3fVuFiVUN+
         91qm7RgDifkTww6/gNC/1fKgT8WQAMA1lUgfRnbhVLEjPklAortFewbNK2fl77+YBMnS
         RnwKAwE8B4V98X4Kaw0nlAKQpIIlKWwokM/ZPbXimwuwuD406OET8z/liiaPFDXpciZo
         mriQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNgfV7mqJMpRpQkHr3y1MyH7vBna3ccLa5k0PIbUpI6V01yQ3p3l0Lciw3i1crdiPJwzJXefD/nrM2fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmEtXp5/Qjq+r9bQeCGnPQgsiHxz8EhYyy3zwM0rO8RfWNY6zd
	k77jN7oAkNoKzNyE3366WwtOwt0M620deUTgSdntr9RqmC8A1eSpgH4E5u7gHv6F+oc=
X-Gm-Gg: ASbGncubQcnUmKzow/iGjeV/8qhxe/xvTcWkiqa5xssRgErdSmwhrorsfNVcd+7nks8
	Rg4yvdCXY+EMHmEP22jQdTbN1Ip/CeZnfQd9gDDCM75w1aUoNhQlJahNhQfGu6eBv4QDIAtvoF5
	4/PEIryRrTBcVoss3ogpNsgOCV0YIgO2jL3NLcoMfafTDng9aW1NtEkXP3Dm3uVplPDaJTZ18hh
	GAGaSRnHmF7yeLQzdFKcTT+UXFuHxYvNUKykIjIOZOjeRMO1qx+2ElMm6SC+Y6eIb2XImBHoIzc
	y1kqp+qfqyjGIiI9/niMJUZ+bSYkw65YrWvs/zBKM3z7TKGSKAwHzYLt1EkJHTT8Ekc/pK2VPJr
	bbHsvTzph/ZOyPx61vEcvMcLiEssF1Kiqq/Rc5BrgPg+/7Jv4gLlApri3J5Ze0yLyzqzovTEHqm
	QmS3aNYV2tKoJbP3t06EB0Wp0/FHlKlg==
X-Google-Smtp-Source: AGHT+IG0l/2slu6V7bbZR48BMoHy5O2kIXbxky/cFnBGBo5QTAKOZtCP/w3ulfdBtRinJ5MOJJg6Yg==
X-Received: by 2002:a17:907:72c6:b0:b46:8bad:6970 with SMTP id a640c23a62f3a-b50abaa43b4mr1251023966b.36.1760095432092;
        Fri, 10 Oct 2025 04:23:52 -0700 (PDT)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm209905766b.59.2025.10.10.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:23:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Oct 2025 13:22:00 +0200
Subject: [PATCH RFC 2/6] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-bat-temp-adc-v1-2-d51ec895dac6@fairphone.com>
References: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
In-Reply-To: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760095429; l=1052;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rN2PnqvN06c7mlTMsnkt8Ofc5TQdsHN0zxf8VF8tMcY=;
 b=y9o4c7jCYDMJNFUkH54nnz+m4QRI1hucrIu/e34bCKs0obhf5/NpX3CWg8CXfUXEpdGxzNqsw
 LlijOXkdwZEAyChf4nWCfOadjRUMdruziUetVwQ5wH+z9ndzcBSuFPr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

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
2.51.0

