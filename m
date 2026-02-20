Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26931D39A
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579156; cv=none; b=E/AHZ9nXGsJ+zZNmrwHcUVfuOpqvecz7J3BOPnzi9NfuRs2mTRVzRKcalylIUJFFFrKR3i7YMuSATfbt6QQlDBkdjtNKCAnt5k6hgyAUObKml6tDIB0WipfewEfjZOBTYqypwjSF9+LuysNruLfPEXIdUE2QY0n6lx8wmjk8KtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579156; c=relaxed/simple;
	bh=isDjg2KdEDAWzS8eIlvfXGW5pS+9OiwjRNsGXauVrws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUqCPpGhW+vBJlAczhL7OhxUhJg0Ba8wl/jW295k7a2feRDxZ1uhdqdDWSKU2mr9wF7AU1wCv5IbO/4q1S2D1DRgg5DfWDEkh99zL5m8MtsZD4fzH3UN4xXd9wwNgFbu7NlOlVu/wnygGXwrqJchyt+KhN7jCgBOb3Twv0GuJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N9gjeNYo; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N9gjeNYo"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so4716471a12.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 01:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579153; x=1772183953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYkTpRjooi8HA/4JvTDsm3YoyWiVwSiSYVAVY34W7nQ=;
        b=N9gjeNYotHVttTLbIJ/8dDRB2Y6xz0zLJ50xkSPnY9oAweuDaRAgFdJtB54PuMzLt/
         J9REpQGOTlIzB5jetXjcWN7bx8IVE+SkDO4lfC5DN3Ycd/E8nxNiL72wO9iWf9UqouCi
         Xef1Ob1HSXJHwi90dLy1NoB/K4CU4AWSXkNW3EQOSioK6VI6QjyJsdr8cUeZkfIC7nsY
         CJTArJiSx9y0/ZlVg+ORCvBDpL+9zUPG0Beo2wtpcJfaawa7H67jz1fVWIkw4d0Lu/uD
         EtZdB4FlFFk1LJuWEZgK6e4RFtJDIvjfv/bdl9m+KOYlRUgJbSPUXBQ/Mvp4qN9JLqWL
         51JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579153; x=1772183953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xYkTpRjooi8HA/4JvTDsm3YoyWiVwSiSYVAVY34W7nQ=;
        b=vBuM6/SO59oUyGjkxkMejDU9BhttqxnRz+LkVF2Rfu/g1TE2A1paovx1NMDJi5wy0u
         BB5w7AIIE0c44JwQAIhF7tfVA691y6x8XU2wRsf6fvD5wZtx0Ns0X67LWjil5O2QlkE4
         UmJpxr8obxSDRKWQKVLaRcEQImcerXhd8r2s3YNTML49McnFn6vXEOMugraA/PjX526m
         C2ugOxwFw1KGBF1RXbfumUEu6B7kiRKq0RBHhtmM/yUg21VWec4RwVJvcnn9T+wnHVrr
         Zzl9xDVbYbkkncXYlstUYeHUlB99zkCMGkp/QnsYVI0N0g7FwTJPQw+Xe8QP2F/WBsrs
         XQyg==
X-Forwarded-Encrypted: i=1; AJvYcCWA03iLBEm2atT7OAS/YACvFhT3f2saANrVEZqYTk3qbWlI3yvxzm9VuC6edulzbITxVkrB43nQKWvPoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaSudrHwIxbO5+0jEhynVaR1lc7NUkIsIhKziYKm34eE9zwVe
	M8fr8ttkviO0Iqr6Pdzu0IErsFBvBS/gny/rKCNoJYzCD+lQiOXkIpUgIdpUxqtHTYU=
X-Gm-Gg: AZuq6aKekWXmAijWYgqOLBlftER6U36CcXtc/KsVuGLql1DV20mvA0OsWty0q/m/5V9
	mYScAgrpIgdh6zA0ORLbuMXtjjr/gzZFDG2iyj4pLYUqjN/UIHmOV+a53Z4S7eTCLim74LhrOFC
	LTYcEauB+JQ5fJpAe7rCYC0rQMsunjlMrOUg7eF5a4yZH+FEEf/YsM84iqSmCWBl60SrAmjKSyn
	y+TwQIByhvrYZzENYx1niU3FPC9tLk+d9G7qVC/AueMcjJ4N4f//lVFExWMgPFhVJtAlahVm3Gg
	CKXk4tVMrYBiBkLCNC3Cc54hcR9ddMaylOWjAY9HpUzsIGp6/I6544RhBYiO0jr1k/Hu0Z+ERHy
	6UyRM4KqFSwP7xsV3fs60xNTPT8TbcT4Gidus1OdDnY5lkNplcdb3WnYn2qsVCjOj3woEP6AJs3
	fzkBqghnqpY3bmtXxvOZi73nc5lmpApOCvmAiF2lDcHipcXeUrD2DzC1ymwwlfkKXOQAja8m3VX
	uxsBpKzTla1h3tr
X-Received: by 2002:a17:907:1c28:b0:b88:4224:815b with SMTP id a640c23a62f3a-b9073049b87mr76905466b.3.1771579152977;
        Fri, 20 Feb 2026 01:19:12 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:12 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Feb 2026 10:19:06 +0100
Subject: [PATCH v2 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-bat-temp-adc-v2-2-fe34ed4ea851@fairphone.com>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
In-Reply-To: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=1052;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=isDjg2KdEDAWzS8eIlvfXGW5pS+9OiwjRNsGXauVrws=;
 b=ZSVbqDHsSdLJsSwCkOzI7OsESGGyedhA0OT2p64wvJLLGx+vATaufPEQiebJ2HAoVmJZuf7QM
 fP2hUioU8+mB979BlBrTDKKHkKWw0KhWvQYmWm2xVr4I1nKLQZDoVeb
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
2.53.0

