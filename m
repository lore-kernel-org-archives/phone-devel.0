Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003639;
	b=h6gOxVTLpK8zMvXBhljFEwsEtGVCHzZ20ePYeRmF/vf4NlY+K5DZu0FDyDJmnVYBHWB1
	 3shyqgQojmRabQTHmPJSTLW68YLISGaF2zOY1zIvYgmkHNJZyRcdeai6aZX+cfvir3Vpx
	 wqEz34K7ksk3LMepq0BICO9/BhDhgkzZ+PupDrPuQckwSQCf2wc2aCVGwCvz0m6gBHs3a
	 vFxqlMF3g/ukZ4wyvvS4dpAGC8JZwCEvj9srH6kEXlha+jEFHAbP06SxEIM547IOzF4Ix
	 3KrOlov04wK1TEUVeOvc5QvEKaWDUUtpPUz3td+f2Fq8SnIpHivtuQ4aZMigc6Bu4eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=w0pRshFzVOqDOoYdOapFfetyvcocMfmkhTfQZTFJ2me5nRZYvYgwMr+ZK1q6zOXIgL1z
	 gdeb8nWWFqJgzhGq39ByHpDRwQWN3kL0DBmSlLzK5lIKl9ePicXsxRLa+np2o9mb9O0dO
	 Ab2SfIfu7lbvFjBqJ2KFljT3woP3D4S3uMxdGiMGtVQ7xvk59RgJs9qEYw4ve9jF6JEy6
	 JyM6vXNWIWQ2KC5YQz4vP3x2k5DIp4bVCB5ESH8/rAC8VL8zfszY6sM2MadxH/4MdSAcc
	 3IoZ5M7hgsCMMgq+dABoTyUndQvQj0o94LuqKthpe1MfrKh0q+LPXL6U9cB6tnuO4sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE490606A339
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE490606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so725430f8f.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003637; x=1795608437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=rMquM6ptDsutIaiNx2Yw5NPovGela4gqxe32OKyBmkc9+Gr7c1LXKVFsiz0LwoHMGi
         580ZTI/Av7s/ToqUw3YGWhaZdKj7L+hk4AC7B7/p3oUSV2yaMvuL4fouNWcm5dvtEiAe
         E6O3Oo9LdLfW/a+SEPyGwjfbvyak/8GurZcJQhewbWGcsuzxAN0B9s/B0EsgD/osUoyt
         c0GJIVMyfi/frV5jVG6gZdURV0zzIO+LR1T6rddoFztdIlwcozOBUT/HzGNxP/7c5zQ6
         vFlHINj3hmsNKKhkennDdAzLsee+13zqdezn44hmvFj2mypUMX0AKnSBH9DuMy1DG1jC
         gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003637; x=1795608437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=C2DHPnwsY8J+s04HXzBS7nw29MhFLGxFC/B07Fxls4WAYYK1E12OpDhjyoxi1q1Pa1
         Ifm3rIPJmei15/NbrRFazGCHHLScD7GK1da686ZRAL0ikhwFlElNbXbZ8FlksbFw/V3s
         TRD07ZYMi0TWytHrI7VDWvTXk4D/9YhNGnaO/+Pp+HJGmqtb9sHBGcbqWhQ5pSSLEkGN
         Fklwwt4XLwsTC5K1UmeGYMvAGXmBPCBnoA1qkb7XvWqbASyEjeTAkJV102DPp6cImloE
         4v25T/U7DdIevO4jMxYCYzPzimRTYa5G4WvYMQsrDXHa5yQo4CweCveZKrWcg2AvEH86
         pqZw==
X-Forwarded-Encrypted: i=1; AL+hErHsb+K/7DpSeiD3u0UJf0nTPuLOeAh6QML+sY1JnPLprIeBMeI17EVAKl1OlJUE08Yr/hpfVFYrVOh7ug==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QPEoUSZYe3RU2+TQQ6E7ef1Ylx+CRdrw+e1fHYVTwnrBPFzjL
	t55c66vuUvf3mCYKULmCLY7uVbHv3OorDSi2kLOuMUFKe8i7b4MrdVGd
X-Gm-Gg: AZFdTZevkf7lLT9dtXPgppPQZYgWIvtJ8VZ8O318bRUycJrHqT0T+1E1ilfEr3QsyQV
	4IEsvfgLzlDizV6TRqrmNTrMIG2A3UNAPc4FwKYTuTm2C9rZZBuHaRR8FFHEUYOajSgUciPnpK/
	dXf1hmXVc4e1mK3JwzjleC3XLbOtTZfsCLJkmWigfKWoW89XIS+Q/eySGDRRUUl02gS46jyM670
	jIPxUcSUDrSXqaHTtyk8DySHqkFTI1r9prqMWQwI3BIH3AvvvA5usD3kanhOiCedQleyOMOuaH+
	V2TEBs9lIP0gxb8hKVCz9f+1Ppr6bNsCNz9+YT35A+kzPWyhiY5WN9Bs3OcBIoRuk9VbRHRiHlF
	3XZgvfuFSU8nqkG+1GTqTGNtTE3pgp5c5kWOo90NrT96nHbgrcXTMVLA2OgSYdtyTPSwEBuPPi4
	32qr0hh7YmYBngzblkZe1w0bXGBtBa+y6VyvjxRgXi8Z/HETi3Z8i1anU8KWVM9gzlzmqy6mHqe
	+GBv/VlWgTa1PW4s5xBRpwCK4Q0pa0JXgPUoV/+Hct7q1Xk0Yubc1/LLpyYO5NrLOzehoLfhjWZ
	qWMEmknFDbhfhs9vNZ/HuyMh/1739QERD8GLnmMIAvtEpb1Xvt/JblCKc7HX8bNGFeUZp0N2bbX
	/8CoTPuQ29i+OBNp3enIJ
X-Received: by 2002:a05:6000:41c9:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-4a638eb6cf5mr4646275f8f.21.1795003637378;
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 18 Nov 2026 13:07:05 +0100
Message-Id: <20261118120714.31505-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

