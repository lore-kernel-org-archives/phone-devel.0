Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB8233721
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 01:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331025; cv=none; b=hMFx9ogjIGc1poEhTyCgXyXyWmCMsI+oBmb1FdjcNpSBJpvSv7XZtWHymdFb+aVPS8/JK1hxtS1ZchV+24nLfbYBxtl5vTRjnkdp8dQftnjW3uq+5Sfb6qNj4xhfQ+8CBvOrOz1NXjDXhneLNdy2KQvmkX5ZkuoBrFLrlccn+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331025; c=relaxed/simple;
	bh=i2fJ3oSJhw/ySwSUDxCvlBN2veS0HqsGf63LfSGR3lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVrIALLYdnatj7s4OZguTpZe51LYxANTThsn+oZFlXipeW5vAwxs15qLRlKtFBeo8NcrzhA9TnUINzNXwnejMFyQrnKKigxmou4SPZLSse9R0hYakaugpK7y9Jfr1pRsIBS3iKIpo/AE8ViExHe12RUw6qrawmpbaswASVRr8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pcvSqt2n; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pcvSqt2n"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso3716075e9.0
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 17:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331022; x=1765935822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT1PuSSF/qNGP2vBlW8tIhEETokKmkXeWI2rZb/bUJo=;
        b=pcvSqt2nEgmPDOuZArN5hwfZIGgp4izgc2qvQU+/d5PaiW6z3sfTVwuB0OWNp74IQP
         pmVlM+tk+YaatGMoQrdhjiEyeba2Ha8rLSKP84qxQtfzWcWamN7umC8kbz0t+G1R/zQO
         roalzjG8LEe0kOAKpCQO+YAWMUp4+n87WNXQ25a2ncPyhEArTjO9Ok7m46o5skACnl8T
         5kDBhH6jqt2QisPyn0nuzYq5yFFVvcHa6Keo/Gl8ABVJk0MKotH0S9ZN4TDoRG9EkMAB
         fXveOV7dERT/0eL6WRgVQFQ3FItMm6uBZLOmEspHiVFQZi3XqgafGYs9eD1EHsi0UtN+
         j40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331022; x=1765935822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FT1PuSSF/qNGP2vBlW8tIhEETokKmkXeWI2rZb/bUJo=;
        b=WfXORKfFcp6XJmgb3/7UbBVrARTYCVFq/DIETg6AmHDGVLEC10DGoYS9OyJHWWcVqW
         0bQgOuX1ruOuYyLIC0ngVqG+/z9LJQq/+c2GrW42BkMdJLq1iyYRaqghs3p2EadmmqoI
         sUOhs9vbS4vO5aybMqhqug1/dc197bzeIeBZhi6kY4CzpVN7+WT1dhD2hjKkD2JWijuk
         RQkt/Yots9j5c0VFmpO/iEIKlTq/aVpN0tPxXUVTPZjTlB+6O19bTGNS91tKyBrkTicC
         T7f4JN/HG+8UchDsX2J6Mlxb97C5Bp+DW4oAhV1Rtko3uiJoSHdCndEIeESj7bzsxqjb
         YzWw==
X-Forwarded-Encrypted: i=1; AJvYcCVUACkg9BR+e6b3zJWT5lMhedu1tRTwMK7VzJ2/mifqmtYemJlLpM5cqX9CA8wf40545GFLZsCN9xCIIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU1nH3z5ob4B+3AJomiL4Vn3cG9FBY4969dle4LP0U10O6Kuhh
	WsFwYceL8htai97/tMqvRtgaAijv8JxzmmEHg8H/KFIF+x2TvwYBtMk+Xpfk0BAyBG8=
X-Gm-Gg: ASbGncs6PHxR/DVRKBhX5667wX8ehqeuZVJCCWDjTR/PPBGJJVJjE00LF0S5bEpcEnD
	OUI4YP+jsChOQnFZLNDqkWvCzJaeGVsVpffTWm4AfPyclq0e9AJrpg5W7meXpGKPSHFZbZ4ePNH
	JCk8pQNprr91Ar8dC8PTVTFUvRxbJt1X1hZe+kR1rVGTpzCW+Dh2Ev2pHcV+q9OowUjftZCilLM
	4cT3J8xrlRxp75ZywGv6Nu3aOjcX0wwseGSLU92K4DwxRD6TBwW96BoRFEDsrq76SBEBxaFAW8F
	U6AIHIT4/o94Nturg6GL1k0TcUzYVa25YY9AG5DvEcjCt5fMVduCxVhIVVKXcwgtuFGNjJHS3Pi
	wx9FCXi/n6g890ZCn/ZK8N+igD5bzb5dsNQbM/DBXIr4Tpf3TLns6zytwa9ufNO3++GEsK8UV6a
	2iscRx9JgSaE9WjsUWNc75I1SpS/14hUaAaWQtuakLc+PL1L53oQ==
X-Google-Smtp-Source: AGHT+IEBw/92gO6sgjRnYsvO6wdv2q1g/TUhOcjenuTs2Zh7ccxVbKZSVrtyYytk2eSeTYPplHLThA==
X-Received: by 2002:a05:600c:8596:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47a7f91933fmr31692325e9.7.1765331021761;
        Tue, 09 Dec 2025 17:43:41 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:43:25 +0900
Subject: [PATCH v4 1/9] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-sm7635-fp6-initial-v4-1-b05fddd8b45c@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=1206;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=i2fJ3oSJhw/ySwSUDxCvlBN2veS0HqsGf63LfSGR3lY=;
 b=B6fM0qV+kskrVmWrQrdWrdJegC4lscc5t5rGLEmjxKdgwtQcYnqbU6yJ2+Vpsji8OYmgZzx3Q
 zOxdKXnTJnFALGIximQ+/5iJfIDmy7CiRbk3LF8mMSrBGYwC2Pw+dYY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the CPUFREQ Hardware on the Milos SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 2d42fc3d8ef8..22eeaef14f55 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -35,6 +35,7 @@ properties:
       - description: v2 of CPUFREQ HW (EPSS)
         items:
           - enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss
@@ -169,6 +170,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
               - qcom,sm8250-cpufreq-epss

-- 
2.52.0

