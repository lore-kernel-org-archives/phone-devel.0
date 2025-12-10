Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB023A994
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331030; cv=none; b=GiHgUgTCzpujBQTHnTIHY4GhWehLiOctVvyTvIBHESB+LTNJOvCx4OAjEoRAHv4A+B3eRxUr+/BBj7cs9mgy14ypkpOUosvZvqGMfHU+r6L0N07GjyxCgb2/Pr+qbBR3Wt2jaH3pIUkq0Y18rY7spd9x6oIP7va+lhgByrrhfhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331030; c=relaxed/simple;
	bh=xhCXot8hsmFt2DLcSKtSiw4vNTASFIkZ8KLq7GSl+P8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4hh/4OaOI5C9of9e1Q3wK+nBIlQGkcPkoXZsqwsZUzSlBCQ5eAoLKLIBN4Rw3IsWBQv65yeZP1EpUltKvuscXDkoxdvnjJadcUHFg5/0NZraKd4jqhAKDYDF4E2c3/Gwr8uMDXT+CFrZk0HKTrcBI0hI21C2khGcqyoR24G2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TKDHQREs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TKDHQREs"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47774d3536dso3716585e9.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 17:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331027; x=1765935827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N0IBwFgNK9lNAZzgqz99M2zuZW1zwkUP1bnHP+9GJI=;
        b=TKDHQREs54sbkjIhQkuFn/XV6kK+54opSLZ6QEKOAU5/EbEJ2CZTvKFZ8x7Cw63YEM
         k7rXeKv01RwL8bSnW6aKACEBZGLkZspsEGtiFumr9SkkUAtSNR2BxyBPy8oLJnxe9tDT
         4mzITkCSGwMNHrwR6vIA+V+MamKRLq5smB5EnbslbX5XQIh+BcsfiHLPf5UOG7HtMY/F
         p1nb37fs1mHyp98HeRV3h1dmcIAdq62loFtp6G2PVmMWhcHGEsVptY11sEVQ+KzzGpzC
         AnQoGjGyyd171mH7fBbh9SY4KorjMHVr89t3Lj9J4NXw8ZAOmHPZD9TpZ9XppEH3AArL
         3Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331027; x=1765935827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1N0IBwFgNK9lNAZzgqz99M2zuZW1zwkUP1bnHP+9GJI=;
        b=VqtgkKV31KhQbPefTGqwm75locmDsbF3of4w7nq7+AoTrhuWyyiy4zsCBmNAfOEcc6
         68EQxlBXAmTTRrIcLTRpwqPRHSnZ1EtH4f5yuNeYPy6t5OncwoY/KebQvo+U4Kar+AGJ
         tmHfaMbwvWtaG/Uub7XP9l5JY6K+aMdzieyOK1OvKkWL4MreHwASfe3J3vk7wIsVXEdb
         dKt+9JVhReLkHInKBnJ19OB8cze0YnCYP+FSXERB9/2x6RrCg86f80wFNQTAvC/LvfcY
         85zfeehBx+LLa2CQn7O+uZYe4ibHq/gdwVzot4Wy8I+GJm4/zqwfpZJGYEWDZe4Fnhk2
         rRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWleMo796hEeE9bs1T39arHFWFp4Y2IsM+eVwVMp9kiXfkipmKQG2zKJA4P6vULqdhpUKLV0+vrtyTUXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOENa4w9iGyB17UGIsh+iqnH9CZyOVJ/jkdgGSZe6dTAQ9BAn
	mEZXTW4wzVePOvcTWr/0rmXOmaSGHRvnlFV0/qCIZWaV95W/TtvFgSWJ876fOfykELU=
X-Gm-Gg: ASbGncutcnEjGh2/tzQBWtbPcEr7chAi4kbMIJDXq4GysL2WBA4F7MhitALGraWLd3U
	rmlJpHTLd/1dUn9hmP3MvaBDr7DLJsdeGtD9WjLjlxFvjlB810lTtIxSSR2yq7KSorOvsHgei4w
	CrHPn4L7WtJoIHd+wFUiBREGMBpdQQza16VOGVVuIP1brt54qdSuAe9k0F0fvrDmqiKTx4hp/kJ
	xFFq8Qz/VhcEpLNOgXOio24J9WaaenxOd4uzTQiuqcDuCGq/Clukgo1+pgwuaaLa5Dx3mps0Gan
	ZgQVP9pT6VHjI8HdYSvEPBc4FjzSquzN6/F+3EO7/lMvyAAGAcUwMdKOYvh5dvDjcJ0+Rkn5MAi
	SbsON7G8uzb+sbHdmUSmx88ZQni6r/SmK9/ObzYZpxt+8IuySGP06Je2tsAr386xwaAhkfUyqlh
	23rGBSw9zcQQrnBup6ApPSYNBlfg3WpfWSOHVsunok+ozJy3xOrA==
X-Google-Smtp-Source: AGHT+IHIpDjAlaX67+EUBebH5WfoD8XeTaU8Q1moEvenJxA2sXGjjcYDyHTWr5ZiRpqzWMTjThGA4A==
X-Received: by 2002:a05:600c:4341:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-47a7f919251mr23649585e9.5.1765331027253;
        Tue, 09 Dec 2025 17:43:47 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:46 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:26 +0900
Subject: [PATCH v4 2/9] dt-bindings: crypto: qcom,prng: document Milos
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-sm7635-fp6-initial-v4-2-b05fddd8b45c@fairphone.com>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=921;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xhCXot8hsmFt2DLcSKtSiw4vNTASFIkZ8KLq7GSl+P8=;
 b=uiHgbBzSh/cvk/RRJg9TS9wPZ3NQ27X91ICPemjxsmFWX4ZAsH6iHP01WgSN8lo1qZwesg/1h
 kEnQZwCIdjIAGmxpMUxDCitqwcrIBDFnbc/XAkCmlbc6L36YYyelCEc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document Milos SoC compatible for the True Random Number Generator.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 597441d94cf1..a9674e29144e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
+              - qcom,milos-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng

-- 
2.52.0

