Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA485247295
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569450; cv=none; b=WR+qcGC84DrieezGVrZD9DncaySfazr5cOj7QMM4GKiiwDuPhjgqCQPgnRgPuIhDFuBxxuc+4M5MfapcJmlKs9SqZqZRuDrjmOUoGpAiAlEQS9YKjVJhe0NH0YxrHJNFBhHNWRyW+glvnjwtQeSem445t1+FxZIgiunSnnyCFu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569450; c=relaxed/simple;
	bh=bCuXidJmykHrH5/xvuIi+xpUlM7CPaWZgEz+0RvmlPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=en/Sv7RW0BRt4OEH3mADUAU3wYpa2jd5ny1ipZSJH3CPZaqVodbgXVejLKss8KT40qCNtGOV/381E2m7pbWD0LMvOnqOg3Wvlju+LIpG3Cid2Zd9uaN/+H/pLxh3HdYVEQ+bfZKyQpEDDmRjyXf5vgAccn4/62x9nDej3ZipjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QTM7us57; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QTM7us57"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8765b80a52so322867266b.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569445; x=1769174245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dr1dBlLLfYPYJFN+bHMPl6dVd/Smnn8ihazbVyoDL5M=;
        b=QTM7us572usDv7AeGtPhpASxDmrX5F1AwqpHR7EV525CzknOU59DMIueJ8/VjToFvg
         cmEbT08FyE+QFpO1L9Pvc7OO3NSk18sq6LSW7yd8Nf3Qj74DrdbTeS9uwghxelNNCYj0
         LERiEbgHdZYprYoKOvRSCBPRRWqDqk7SxWe7ek7yrWQibjUTKH4JbxkEzBSYQPgCJR4O
         hSko0JfMSbPqjMGtbQMmLTHXw5ji3D6rbmqiUg8GN6bFi+RSe5NxppaLXgyEIit8+M3/
         Fz3LKIeuKHYXCi5e7rFp+NsStST4khP6gAaawa3qImFMxQgMtNl4cY7g4h47GulLih//
         n+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569445; x=1769174245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dr1dBlLLfYPYJFN+bHMPl6dVd/Smnn8ihazbVyoDL5M=;
        b=bxusxCkao17YSjf4Px3+KrwIFNVegkQi9zA5CKG8M0kM0W4pXvXEf8KIf4baDYzxK1
         d4bYUT2t/Oums8gkx7hUPlG6w7I3EnWOLvsTkd1wgz4fl7OQ/1VGe0xRJ8BPHxBcU1sl
         9Ym9mEuzv51HgtNlIqIrWWLmn00AEEZommcgafm7AZVn2rjV62iv4EIZ3Cc46pyunTTz
         FeJNvOwjArksWrYLtdjFCNKCc0qH7riv/9q+5NWwr39p6rm8O0lZL+Jx85cNOdr1VLWM
         4f8cg4s2cR1H2QbTrmJ8crH+Vq4bd4T65wgjVkuTsy19Ei//5rE3sMGvbYxYkg7Qv2Wu
         2PcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHPjnS/1iGuxMVmO+ExOPix8LzyVgcB2fzwC+0o01RxQe/NTeCInyQ1x7OJpw5tbRHmyX8/Pl0yrRpBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyht/vkj0mhcnlZKTcYf90tNzWm7Ewo/vxCp9jHcXt69TkzvnZZ
	5/0n5tpXTPnNEZFqsj5BL2kwU920QeuEb5gz3XLnM2UFLptT6jIlDsy1SAfITW3iGg1UjNSjk8h
	hw/1cxiA=
X-Gm-Gg: AY/fxX6TvEXG51nlR2H5lO9PwNubnb0wFCahxYI99MyeNz++4o42atZOY7IT+C8p9mU
	KQK/kNy7aULfhNfbc1vLA2H5du2rs4/8tOGjbrDlDTqKzESKEYd7ZyHJAud8tdgQCDlzoJAuYvT
	AM4NMPOr1ukxXc9aw9JupcERAR05JSbGFJIVtHk4KIYBaZzftHPSYM8Boqz/sBlNLr0TM8z6xqE
	uJ2Gp77ZjdQ6sGLz46IMyTl4G20x+ibEHzN1KxVZVznVHPClTo1152v/PSfRzMzLdnT/7f1i3ke
	aiNEAf3VG2VZXSFmhzIvQzZoLYDSDinooiquwh+M/xyRpobaHaZppklQrB3Kl5UYSJAbGgxRDoW
	7f/oB1UJnWlthwVm999OsGnCPuzHV/c+9nz+ed0oK0xONdi3Nu6equ24EIGDm8qY9jCSgrS1nVT
	13LhuNxEh2TGFBZvvOR6lYgpm5bqmKUtCtAza4V8QjGnQxJLKnHchR++PQtBKDZJCS
X-Received: by 2002:a17:907:1c09:b0:b83:f538:c2a6 with SMTP id a640c23a62f3a-b8792d273femr262706366b.6.1768569444776;
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:20 +0100
Subject: [PATCH 1/5] interconnect: Add devm_of_icc_get_by_index() as
 exported API for users
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-1-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=2212;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bCuXidJmykHrH5/xvuIi+xpUlM7CPaWZgEz+0RvmlPc=;
 b=gWnOVQzJkci4lXcmtXJVm6rHU7f4/LCiwxPAkRBMrt9HO3Y81FpwwOdbP5nuH44jBz3Bhr6mu
 g+++h/05vt9DCDUphmho3T0LS2WKvANznToIrzPt/SpmQ9c1vKStIai
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Users can use devm version of of_icc_get_by_index() to benefit from
automatic resource release.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/core.c  | 20 ++++++++++++++++++++
 include/linux/interconnect.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 6cc979b26151..2242554525df 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -443,6 +443,26 @@ struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
 }
 EXPORT_SYMBOL_GPL(devm_of_icc_get);
 
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	struct icc_path **ptr, *path;
+
+	ptr = devres_alloc(devm_icc_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	path = of_icc_get_by_index(dev, idx);
+	if (!IS_ERR(path)) {
+		*ptr = path;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return path;
+}
+EXPORT_SYMBOL_GPL(devm_of_icc_get_by_index);
+
 /**
  * of_icc_get_by_index() - get a path handle from a DT node based on index
  * @dev: device pointer for the consumer device
diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
index 4b12821528a6..75a32ad0482e 100644
--- a/include/linux/interconnect.h
+++ b/include/linux/interconnect.h
@@ -47,6 +47,7 @@ struct icc_path *of_icc_get(struct device *dev, const char *name);
 struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
 int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths);
 struct icc_path *of_icc_get_by_index(struct device *dev, int idx);
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx);
 void icc_put(struct icc_path *path);
 int icc_enable(struct icc_path *path);
 int icc_disable(struct icc_path *path);
@@ -79,6 +80,11 @@ static inline struct icc_path *of_icc_get_by_index(struct device *dev, int idx)
 	return NULL;
 }
 
+static inline struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	return NULL;
+}
+
 static inline void icc_put(struct icc_path *path)
 {
 }

-- 
2.52.0

