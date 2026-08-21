Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47938376A0A
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 07:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296356; cv=none; b=GNM9FHGjBoHgS/Jy+MuM/yRiBfyz/7CWYL7MulZQytb8NEkEJjPnQW02ruLPo73DdzAqIfexIdXgCGiM7xHUKKw3EWugKc3qsP6lyjJuk3brNUUqxCIbHiWKAqUBQlH5ACrtTGsx9+AI2VPlsvNLmri+KMqQTr8EE4hEm87T62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296356; c=relaxed/simple;
	bh=tvgIcEmwbkn7e2pPKun/10FnYGAhaEA1A5qBEsJ80ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyVYnVA7hNahxmn5Pr5NcdSi7H82sZiXjpOxLNf763jN9JpH/iThaaFvdqOawRNvlvXFSNrT1CZrZtkvD6ZUzNdbiiSIcbNifTrPbDKo8/UE2C5nIx2ro7GGbMeaSSP6hOZ8HdA6DJh7ywAD5cliBHkzy03UXyEFFdpQVQOlx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kgWE/OUk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kgWE/OUk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso25149566b.2
        for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296353; x=1787901153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csXrgEgazCRDtxpVG8iq7b2VnqPzoGLj29Ecu+sqIh4=;
        b=kgWE/OUkEY0QuRbLuK2ceSoaceOsV7PG6h9BVHIuEAop5cxWyeVGS82X8CXd0yU9pS
         nEG/+5lMNr6Q0gwmb+VYGUeTVn4b7MA2n0mrwqeCz/FI/uI1VmtxKmI7jCw4pQ9oOBrp
         +6QoRqYLBKGiTh0D7wZUYfQPZEewOVf1rxpHu6+7hcqYelragB52aOULmtrqrr9y1mTl
         S5SAmvwEFhB3N5+pJDJiErA2nf8O1y/JAvn9VOq5rIfulAiHSFz0LS/yu94x0vpt7Soa
         FOiEcMGBfjJzplymuUlSniYxcW4uIavMST5HSjlgmnTYN72EptRm9B2Tkq4bGK4xkrg1
         RJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296353; x=1787901153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csXrgEgazCRDtxpVG8iq7b2VnqPzoGLj29Ecu+sqIh4=;
        b=PvXQsdSIItUWQs4HPjXidGVOGfoboNHm31Dt1hyctXCC5ZA29I+sYN5zKZGcKmIV2n
         c3Lqjqu4V4w0Xgvi+ppPK4LBxASS5LWoGaSl3Oi81bWshyrcwhY/kqLUxpU6cSKFAF2K
         fx+QGtySHf+nz+TKrD2G/j9CcrbbQfc4vsItCm5pVkbgFqOZNf+/mVNY1hMXs8RB29Xy
         lPHYlseWRecudryNKArhgDa5V7p+yWSNkcP9ZuDUzZlETpS2AL8coasBe4Fe0gHiTHOk
         MMUxJIfRLtPRZvqw/9tbRQ6SbugiCFse/OYWFmcO+wMn9emieaOpCH1qJ5IMrpqz6d+0
         sI8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqa4MSjhbz0KWEKixZ4KNGc7Ao+d/6MsL4Z3DxxTM1StOjbtLuAplG6VdaUmdCIfZOvTBWv7Uku9IIIGw==@vger.kernel.org
X-Gm-Message-State: AFuF++kwxx/jMbe6iZyQd8N0hyIz2PDOw7CafYvxGVAe87XzusTXxq1o
	7Dwi24ARHyzq7P9iA50RmfELm6XDrSFiXwjd861EDIGSh5kMWVc1SAbufohbfph3Pz4=
X-Gm-Gg: AR+sD12V1GUkMRpc4e11A3EgNK3a9g3JFqDvckjU+ForL7Wov140MquzQ3TKEdkik5R
	6ya4cEGMY6zsC5qqh5sh7k91RCQ+I3foWMT2S71+T9PZEPOcIWKrxlRbHisEYVrZfgLdZ1b3TAp
	6gG083Ozh8zHCjsjt/N7SZxpROKldG9/VUSezUTdtIBmPweodpRqIzB5qxK2DLurZ+AA93LDjFL
	Z+35OjZve/R+sfzVZvk65uOSROtkPlGhS5bqV2gCqXAouOrGy/BPIgZFjyRhq63KZUHDI8pNNqB
	xhnBpTLROfdJg1G4dlgv71p1Fo8jFw0yd6xAFG3iLq116jpvxYaQ58ykklXAKfwyDIOy/ByEPR5
	f3ewnAXYsQrjZKmndufNqPvuNNSYMh/aKlY2fU16rjgQnRlljv4cg3W7fRlTQl+3H4OpFxilQHI
	fRwhAnYgkMjL9bIyH3Ik14rSElmJKj6HTkb7C3bBNp/L1cuALvCEhnwBDLKoLFSTpHUeEU7cSvC
	bafKb9o4i6BN7JPk/xJ9a5UJ6KXdKnkdMIimL/YL2E=
X-Received: by 2002:a17:907:961d:b0:c24:469d:5653 with SMTP id a640c23a62f3a-c246a653373mr384101466b.21.1787296347585;
        Fri, 21 Aug 2026 00:12:27 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:18 +0200
Subject: [PATCH 1/3] dt-bindings: touchscreen: trivial-touch: Add Himax
 HX83112A
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-1-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=1037;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tvgIcEmwbkn7e2pPKun/10FnYGAhaEA1A5qBEsJ80ug=;
 b=5UI9BRap8wYkbwAe4UYWWdiFDrjr2MCLWHh+epySaUfuTZuusa3nS5sWs8RdUGwP9akCuISd7
 BhB+PXXHX/BBwllIwqdRqub7ah+wgkBTgqZCRFQekyjkihxPc1LYIKO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the compatible for the Himax HX83112A touchscreen controller,
which doesn't need any special resources not described in the
trivial-touch bindings.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 6316a8d32f39..a4b535bdbd6c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -18,6 +18,8 @@ properties:
       - azoteq,iqs525
       # Himax hx83100a touchscreen controller
       - himax,hx83100a
+      # Himax hx83112a touchscreen controller
+      - himax,hx83112a
       # Himax hx83112b touchscreen controller
       - himax,hx83112b
       # Hynitron cstxxx series touchscreen controller

-- 
2.55.0

