Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99930ACEA
	for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218958; cv=none; b=kvOD2qVA5WADln1Me9iDNHawprwpe7Yh/PpUjZCdkbNK6+7xUJ1eY5iwzJjSsPH5iVfUc91Xe+mgTL7luT5IkJXNTWPQSg/b9xUTY+362gEcqcd9vc/EMPDwoD8f2v1ltfxKGhOTUYkL3Tn11I74RLntrhwh497MV7xvqNDYmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218958; c=relaxed/simple;
	bh=Ji+2OA/G77HU1f1xpLuadVpNWAo7bT6AM6eYU0UkkOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r2rv61y1qHG9Zuzx5RQfjhyQofgsvq8jAexfTf2xX0XDh1AaHoY4kq1CpGpi1gVa+ZP/SAMG+cw1xASj45a0rdvORhl2A/L7aD+Edd24hn5S9fL3E1q3u7kWWlAXi2LAo0YHbTWu9DjYLeC+KWDCbS20+v7gpMGhXdIg85/vpW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3buHssXf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3buHssXf"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso1406509a12.1
        for <phone-devel@vger.kernel.org>; Thu, 23 Oct 2025 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761218955; x=1761823755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvQpSe6/vMPCasxVcuAk8VD6h5eBPb8DgHD/tEJPhZo=;
        b=3buHssXfCjKtHP2jmBKtjffuO261NkP3J+UMUSAWZUCljSduxm0LdFlhCDyv+BHfsm
         d4nYP7uG1hIJAHzuxFm5x1DSGE1owOwHyBFDcKaumCtZRvOlUb4p8M7PSbx5ACdjMmuO
         TV9yMTR0FvnNpQZ17dxXpPBcokgfQiHd9MUyOArCLzUwFdgTnNIkzJRLMAvKruBzPzY+
         nVacZXVB9/omweqwtxUNPCcfTUAszhL25MSrvteXcV7JIqIfz7t/kR7Aktwr+d7o4CsQ
         BFmNFJHKYYMmxgI5xVVY/RKUXuQAVLCFvrVJrIbu+e+L8SEX4YJy2TH19a8Pwl0k34YF
         uu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218955; x=1761823755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvQpSe6/vMPCasxVcuAk8VD6h5eBPb8DgHD/tEJPhZo=;
        b=gQ4HLTr9fSZN0qR8lyfmjnuqJb5QW4d6Ykt/Llj8H+P/zsZA88Ok4uOnuZ/5WyU4af
         mIooM3v5HWelXJOkQHMHrmgZ5UOsrHV+90e61GfwNHiODBKxkgTXcHQQmxViEIYjVD8I
         L/iy2AnFtmmiV9Kr8ELqNdikKsHfJSdzthCFFqrFXlV9QDYZHDmFkdyVJteU63cToh4E
         80traQin8Mk0117MACFTcoIhnicVtBkqJWlaI/Ria6638Lx8NrjO1Qcr2Dm7oke1LarM
         bSL0cm6bQcICLzTlcNG0L+jEbblBKdsbVwwjBZKbRpGZAEkRKxjiKOSh3MSGDhhPcQYr
         kKIw==
X-Forwarded-Encrypted: i=1; AJvYcCUVvVBVt31YdC+SK4I1WdLv0oKx4Lk7wNvnp2lNS5WXLLmJkD+jbg1Udrp51W5zBSMN/VU+0kP35fTgDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuDjdnBDoRDYskOBp3mF4U0qJWqYAicuNHVo3/UE7HfNpLZ3J
	pob0PtLYPY/5i7W3w7zF5VG+Zbbm+jcYbjjYEDANbwN5nD9yNMYSqdDOjYw9S3zfGnU=
X-Gm-Gg: ASbGncvJ5kWTw5G3qGXvKNr//Klrmd6pNYmDUIBCHznX+g0zZuT/lZzq/GVcuimVYuM
	Y2LeZdNIxVaaJktI7xbc6YK8/Hh1Gu4QWn9KhDpMVoUN02NtpE8yQLprnBXRAsqEsrUhlt8N+y0
	rYkVdoCeRn63CYj6SAWKreH14jaK58K+MoFYpaRt3MojzkASULN0ZhRwoE9XL7CdR84swjDBm3c
	U9uSAboVzRkfONkg2kPsRx7YCxztR3FrBiTa8hU2a4flgqaapA/fom3J617BzkDouCNy7uNIfZ6
	wsKyfUxI+3da6mS878zwp8DY9+LgeZQNRSDtJBwNeeQLOg4sKr/mnToIYbTz9Ttv/2F1JZltCwM
	b/MMdnwjCAoJ7U/dcMTSc0QQ+M0tlpd/JkLrLw/G9/Ldkdu5lrI9JKYnR5N24T2T0/GxMSr9QdZ
	OP1lRCjGCKdpmygqVz9DFEENFuki6eA9opgYUD89Viy/bE6Q==
X-Google-Smtp-Source: AGHT+IEAiF4kvYBagBPtSGcpjL7Owqx9cK2+EGyXrrsdo3qMlvN5hXcuHy79E89AMKx8P7LbEH7kPA==
X-Received: by 2002:a05:6402:5245:b0:63c:5f76:2d22 with SMTP id 4fb4d7f45d1cf-63c5f762da0mr16853069a12.21.1761218954952;
        Thu, 23 Oct 2025 04:29:14 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb328esm1439098a12.5.2025.10.23.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:29:01 +0200
Subject: [PATCH v3 1/2] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm7635-pmiv0104-v3-1-27f1c417376d@fairphone.com>
References: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
In-Reply-To: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761218951; l=836;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ji+2OA/G77HU1f1xpLuadVpNWAo7bT6AM6eYU0UkkOo=;
 b=MPKa1d8RVu/ZBgt2nQvrDkRsX8rNCMnUMowVQCQp/HH5c6TMQ2gQE1Hwl53Pawo48fFQEIwpm
 if2t3Ddqt+ODHFqy/zXxyPgmOzEHTD5RJ8SitlU0LY656KQMBe1XgEW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..c416f25c90d6 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.51.1

