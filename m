Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD993845CE
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224526; cv=none; b=d+5eaGGUPdnmYmEVUGmT8HTCRuyjiYOLEdEFzRVz18Bp7LrfIiP7dM2hbe0cwCKsS2lvwp6DQHi6M/mzHbINkhknHcxz9NSvpmmtJPrx8TbI2ybIzwhsimZu0vaNXpbsLg5dvJjtynEnHZzlZWaHwegzaqlCxoyd/HYxuGcpZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224526; c=relaxed/simple;
	bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyZqYI3jpf7cFHmT6eVifybPY4z3T7MM6B9KH1STuZB9M8yjZwYxvux+I5nS6KapAy82eqW0qOVCih6QYvhCrTYmIUf5OFlfhn7RHle7f8IhzHWSWN9qmFXwJK7c5+iz98zX2aWK8IhI8Na8n7KewGjwrgzTKcT6V2E2yOfB+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eMcDUq4k; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eMcDUq4k"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c745e18a0so125305666b.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224519; x=1775829319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=eMcDUq4kDbXtJoLjYpvN4DIgSbal4SfAiQ0Bxs0F6N25Fnb15cXqGtpmsKKdnHVpq8
         CqLdZzyAlFZF0Pg6taXCioUz7T70PZlIyUcFqndMcZvtkhWtJdV7ifrGRv4iQoEkzWt+
         LutD/N5YlETUMeRA+y1H5VXvk9QNwV6ekKOL/TBPSmBoBbOkbWWsjWr20FJbFexyVJA4
         6z7DNHy3x4lAfjn+IjV8t5AFlAvu9V17eucFr2iaXX9QwJGtVsziti/srrzqpDfl2WgG
         XPoae8DCwCp2WfzEYiwRVA7m98eNXSbdZ/wcKK0Qz2SJyVvWaVboN2jj8VpK3NgT+PSs
         jo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224519; x=1775829319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00QsAJAs94/ZqUyZhadzKRAFArz8oATvGeKh7GrAju0=;
        b=gHZZ81xbNILkQ0lugIhZ1S1+D0D2MKB6HVSSxKM48iAf7I5scEIlvV9ePrMg/SuP0Q
         OS/XdhaQVoDprM0LGSH1IGge0gSuQcesz/n8jPBVrtIKiVfeGsgEaxHgWeno5XOaBWuX
         +cHcqa8KCQOvR5VwyRUU1eMfX0jOCv0Gydzvdi8xgwK6sEKNekqxQjQFm1xKv0LLy3lo
         0U7AYLpodzD+XvQ1dxFZLP+vataY6+TJBOBNiEFpT3jZgrXsmTNSVsKBGY46WIuZp4Up
         tT3ZRfDl/ln3kFbl1jTFBAX/26V7XgTO/tzKmDHC9y/5kyTuvzwtQbEljOhjjRRve7aZ
         2UPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8riyK/7Y5ju+RDbwhB7Adg75VUpSvzuesSiTyqGKRFOz6HJhBuHZzK7pR1TsPGkS9owL0glF4+ow/8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx31GpC+8L4ywApL+mlsvL8Dnu1hJBD8tWxN+URFLEs93z+JMKi
	PZZ272VRyuq9b1+ErnN/YjLdNlq98zAQS5gD8z939HfKbPaH8Nmwqzb7qQwRBj+T8JE=
X-Gm-Gg: AeBDiev6cL6Z1ei+qKmR2pxFhCJpJvrf66fIg+5uI/V9h7x4AeQReRLXVkTGbXyrMr9
	Kp90iPQGgRVqP2QlZM1SHEq+QrjuIIQfGRCpjpws0KTczQ9ZZ6L18yz74gP8uFismvoUecGkqor
	fD+bfvSdzg3Qo7dNSAmiu5vYfHKMM2xfKYncnilGpG9tZiod/qfnZVVodupr9Vt2aAiLsbj5boX
	yasKzLpsCZaxzeB8Xz7lYl4U2kwhf/n+I3nJacozxID9u/XaWsZRGAIyiOhPJ6+sResSVzs806j
	Zz/qJ13x98lH0pog79EAa+Kg7LkJ2BALAEeFSbZjXTL+9n20y4dNVgFV/+3zDcEC+wQyMiZyeUi
	ISVI8jtjPSfkbRhHhe4Jr4wjuBWUNaZyEfg3Aq3hc1LvWSGLJ3iSB1ewLu4CuJzo3kTtL8gk3lt
	liRXOYWhw/bQMGxfX6cyhiZazEzBDpLVS/5+zzdjkjcpmYA99+QxGEViZgBhy/Oh+qIN0oT44VM
	BzDGfjtSzVWcgPiw72x8/pgjqKWwQJUReih9g==
X-Received: by 2002:a17:906:6a02:b0:b9c:cb1:a61b with SMTP id a640c23a62f3a-b9c658742acmr142510866b.16.1775224516202;
        Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:49 +0200
Subject: [PATCH v2 3/7] dt-bindings: net: wireless: ath11k: Document
 WCN6755 WiFi
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1239;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bX0RSkEhHMY0CQeWiiphb/xjS1x++AeW72AXUrJMhfA=;
 b=DTJTtJ7BKJd8qPXVe3nd0JrxaYiQE2N8bwiN41dxZ5jihuyHGd6fmesGzuo/2w99jisvtHofF
 h8Mx18K34cAAflNUNQSKgyj8B17L/9Yc4dJVyM76qpuovDBjx8PeKjI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the WCN6755 WiFi using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 0cc1dbf2beef..94f8f8551756 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -16,11 +16,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq8074-wifi
-      - qcom,ipq6018-wifi
-      - qcom,wcn6750-wifi
-      - qcom,ipq5018-wifi
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-wifi
+          - const: qcom,wcn6750-wifi
+
+      - enum:
+          - qcom,ipq8074-wifi
+          - qcom,ipq6018-wifi
+          - qcom,wcn6750-wifi
+          - qcom,ipq5018-wifi
 
   reg:
     maxItems: 1

-- 
2.53.0

