Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9083280329
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695943; cv=none; b=rm2MzN90zeeeEIGwFyck1yXK0ZrNa/HqBCdDJxya1O3GPfEjxOMVHzT/1Pb1pWv87BWilPWmZgwLD3/+VDAisv4W7SR8r/9w8Os3ixb7qWE+VA7rfUl3ecC1zhTgVriPnyLN/5bTNfSHeAy2X1oXFIJGFr6IddMLxFESEvITovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695943; c=relaxed/simple;
	bh=grerL1X8PEltlDn9bZfsY+C9u7ePqpUQ4WeAgoThNzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxcXV6NL7KFsKclL3aOWeRJ7VSVXm/Tc/HgazC7pYmDIqkCm9l7LbU2A1F01BiRLNqPnt2wVPV6SvkDDC+YVRzIqhwUi1vSlTwv+t8mY0FiAzJJ8bk3yAIznx5tCIFVtrmtKFdSfXqVWZhFBGYvQag6x4H5YflOzBbGyZQjXcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfcE0TvN; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfcE0TvN"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d196a2334fso4409404a34.1
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 19:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770695941; x=1771300741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHuCRRLW/wv5+lOhXnCHIBJ8PNubsec4dQmyfsYfdCc=;
        b=jfcE0TvNBoVHAILwsw36OvRUhlenSQ2XAPnecyI7Gt2hbeYQvAsqS6opMCQuj8RRKH
         4UmfgmAm0zrTOu0S8krQRqlcWhsd4y1FYc18V3ax5hFecQ4q0R8wfuM0u1GJ4/5/8Gf0
         8c6XcRnXWA2bndkaA2b1B1PRTXexbqB1iuGI6OFOHirchB2eK8TKjaEaP1e1jqU0EZdS
         4i6+1I2XuoeShmAnEUfj9air2BbFzeGfO3M92+JChXh3k0OaYH76QGBlUCwxkszvEZlJ
         PtVuQjdSU2X0tCaSxM5vsTJ0K7TV+TNkWSa+iLApO2YYGy4+LWq6rZMaFwBWdFd04Jg/
         Ma4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770695941; x=1771300741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oHuCRRLW/wv5+lOhXnCHIBJ8PNubsec4dQmyfsYfdCc=;
        b=ZWiN9+kl3JKPOKi3kpA0E52kkE6CdwivzH5ShKnTAQF+PYdNQpexs/6Djpp+d0baSQ
         lYWzgk690wfSshc9fsfep7u64IQwMkH/TvFYXXvW70P0HZmjdzDaGHJjiRJZtbY+b1Ns
         ug3uVKmdd6LbSwD6Xxflyf7MsOoHKmGIJzfXnCmYmwDhU8fVUgLbLxSKnZxFZ10qvoOq
         ZmyLAjhq59zPpFgeoXGYjI/7zVyHc+R/CA0N9cfHEiQQi+U8l9ymEv0u57DuCzjDmRhu
         Q5FDz1bq8hzgDrYzrYX+C+SvC8lEYje0NotDN5PLyZZSp7OK1Wwba2QDqqOkRBAlkLBD
         b3vw==
X-Forwarded-Encrypted: i=1; AJvYcCU40VrlVMBGlVyR672lGGQZZDCW7/F3xi47BpwkgeBjbf/g57adpe+BWcsdkqLze0QCWU4UaATHDItZ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1y5JGF2cjSGttkpmM+lzrAvP7Q8i6xfiYVCkU0FazorTt8oPK
	12k6sXdEEookYhUKuzwEu3XUMbWhK/uFLQdROaIRnakJnLMJBnm2eAYi2Ov2ww==
X-Gm-Gg: AZuq6aIiG8SmWtWg9AR4xGAyr8k+RncWqRO07MHTyJ7+MFqxmpxuEbEquw6Wrt/jFwo
	Ne9gKbuHe67QlKp85hgwWH/6Xb0AbZW6EXQ9/zQ/zLhHy5vesxyCseiAHWjmG/0nqs+jScjTAiO
	DsvVof2H76xXmqXiU+tfqzlvm1DAKYUx0S6Ba+BvEkuzXmiMk1xoz35rjUXuMSQR0HVyd5Qzmwq
	EkDCDNoPO7UhxaE/pPDYuZHrxfekhuZOGNGz4XSKw1+xrXvDEI0L6T9ePxjYNUOKHyDvkLcD1uU
	kmGW4GcY3f6RrIIGKQA3sXfVonFVGrKg+ZjiNj0mTmYP72pbSh8bZF7kO834glfPh06swjEsGwz
	EQfcM33YDfQF8D6LbaseC/Suow/cNgBi9ZkLiKcJ8qSxNLa8CRPeHEhxmKJ8jsSRHiA2oygztfP
	PhQzn9957Vef6/tP3VGV1ZxVIWsQuXeGQZrM5HHS6hPezyKK9seEY03goBMqoV43mcdT6QBgTHQ
	52zv/S9qdbjT0c=
X-Received: by 2002:a05:6214:c62:b0:894:6540:9112 with SMTP id 6a1803df08f44-8970d9da94emr11081586d6.33.1770688893108;
        Mon, 09 Feb 2026 18:01:33 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8593sm926749385a.36.2026.02.09.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes property
Date: Mon,  9 Feb 2026 21:02:00 -0500
Message-ID: <20260210020207.10246-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-lanes property has no effect on the hardware configuration, as
of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
property"). Remove the clock-lanes property.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml           | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..78b9e03da06b 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -116,15 +116,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -139,15 +135,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -162,15 +154,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
@@ -308,7 +296,6 @@ examples:
                     reg = <0>;
 
                     csiphy_ep0: endpoint {
-                        clock-lanes = <7>;
                         data-lanes = <0 1 2 3>;
                         remote-endpoint = <&front_sensor_ep>;
                     };
-- 
2.53.0

