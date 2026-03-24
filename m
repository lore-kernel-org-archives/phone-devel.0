Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7928350A37
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317675; cv=none; b=HAcEZXfBW0iugPDDKsIjfRMM+cn6BQGVgg3lVxIYLw4ktnIgPOQhYUSAmh08QSXVJHj2/VXxKYvRUZYKvW6PW92fy1EtZni2aWCZ1/OTOAYctJO+8nWcCvyppLGfywuxtBt0pdJ8YiGV+rqFnrvGTmrxazYCKth59YGLN5mA2Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317675; c=relaxed/simple;
	bh=xFFZh3do61VXvhto8TMwJeAY2BV56D21KYqosBzULpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WELXh9YK5pfIGJ6F4/xenit8NS0KanOg+9jveghIYL2Ae/h4VJNMzrastkKxxwvzl66kR0fwF0p3I2FKKob8hbVMYRievtN4Qk/X/rdtgl6MacYJW36WWT6xXShMi86Z2Wsj0utMO4DPJ+Bw/ObzL0+aAMQEjULKBFWrqr/wr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyYkjnku; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyYkjnku"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50b68a86ca5so12689851cf.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317673; x=1774922473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty0hATXyl9HZHQUJuw2vSXKHAn6gPHhqKGm7bgTuFLw=;
        b=TyYkjnku7qv6q1ENylFnS9YJWc28ZGo6213ScifRy8wEMpXp3VDJmsqnk+XSrhyV0A
         ZfHlKYJFQaUm/zbgPM2x1O9Xo9HP4bDG6xlH/3ONQLYq4aC8qEYDd6yivA19pm8r1HNj
         qwF2iL9O8UyKw6SdiJKDddotFLyXRAy9DJDDQiW4yKyEtBx6ZcTLfjmTBI5bLIvacd3m
         ncatawGw1OelbN1Vrj3SRQzrbONs8Apc2pQWaQwmDeIKCVlkzrb78UgGI5q7u3n62Qk+
         2o0ZqdvBqDkr04R649sB6BClueU3JPlKwyxL2lF/yNC+Y1DlvuSGkL8k5CvJ+kw/ZEiT
         36YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317673; x=1774922473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ty0hATXyl9HZHQUJuw2vSXKHAn6gPHhqKGm7bgTuFLw=;
        b=s1nQWDzpzSJDklbIV9cH1MwBsTDQQoz17Jtr0WwgBFLz4nc8Rx6wsHPRcM5jQvcL6R
         5ABCAF7bv8Vr9AtlNdOykoYoqgtfg6cBUJmotRFD5PRExY7ia2PyvnRFB7abQ0cGX8iJ
         ulyX3Ow7c6AgQlBT+tyaFu1klmCPS9U9eIjGvspiX80u2FUP3uT0ql9qq2N+ChtHe19N
         7MgOoctd/pg53kU81l4/a3aqMfbgqVi4dCyPB8FnAgGQeDAS5RHREgzOIHXcynq8zrCs
         dAxNqKZEqFDr0dpymH1LW57YSxsG3YvK6Wyl1cv6/X3YyvxfxgpbzeoFbbKgUv3UIRhF
         Nx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzgGmumHxSP8r07RHWidy1upD7lRgcsV6S3JKnoU7Oj+LmrROL9JWsE6a3T1VONUQNFrYvsehx9yluSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCRzExwB5A1y0FfhF9JdiITFrBrZH3c/3OgsD3OwU1Y/yQ6s9
	9JPjx/VbyI69fQsVcJYX10puL9C6+cCZLjBoWL60o6BRCqGPC5J+L+Ho
X-Gm-Gg: ATEYQzy3dL14Ppjk+i7YEp6yJjKIFLQ/B10RQQzXJeYT/JNyog+hPlptFT8s6xzJtJ/
	0aQOUbkT9kRC0cPc8D7JHAI1eQQdKEowbuA6cEbHaOdj2hsoeihRzthvV12qkch+PX1YkkJj4aU
	fKvjHrX7QbZ0se2+O6p59Av2wD0MwAg1BgoPtnhCoJoWE1kGjZgkfPnqEUEWD8lTlUNifG47oky
	x3u4/sW0nMN1LKt3dwdikhhNYsTx4RiCYzMvdRBoxVQficDQ47hYh8LKhs2SUuv5Ecc0QJZRExt
	at2NBvtWM32l0rgRVUf1j7hxcUddyDMcn7Ol8w2OBtKqWPIi2tpyBA39tbdhJzCDscq4Gfv6TNU
	N1CsD55Q8y7V6dofih8WPOxE3Bij/MI6YWsgeWHyEW3qB9HdEYxRQXA6bGAu9muiybmepmcDake
	mU4QhXCkXTOFM+CmzlZVF0jimXpw==
X-Received: by 2002:a05:622a:1486:b0:509:456e:a179 with SMTP id d75a77b69052e-50b3757374fmr219881111cf.64.1774317672550;
        Mon, 23 Mar 2026 19:01:12 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b6d19789bsm15864691cf.29.2026.03.23.19.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
Date: Mon, 23 Mar 2026 22:01:26 -0400
Message-ID: <20260324020132.8683-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-lanes property has no effect on the hardware configuration, as
of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
clock-lane property"). Since boards with new camss support can omit the
property, remove it from the required lists.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 46cc7fff1599..084b65740d53 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -124,7 +124,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -147,7 +146,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -170,7 +168,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
-- 
2.53.0

