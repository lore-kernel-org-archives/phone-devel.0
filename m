Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ADF1946B8
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940677; cv=none; b=skWq822AWJ90f/ej/0aOLwjbHF7Jn9wtjpb+MbK6fO6J/PccVTe+Ct5u71bGcwBxm1HiVlydkPlv31c7dPxdQh/p9iVDkkvYMSLstNUoiVaBfJCN0mA2UOedZhCwWuFM5Fpe73r7KbEI+h8yADut8X4dQKVLGa9TiAIMkZVzPN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940677; c=relaxed/simple;
	bh=w97u6BXDdV//+jswswofrPD9VxViQ2Pn0svg6KRTA6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Eve8VWa2pW18iedDepcvwuI4RHEM1y1Yt5P/u5FsWX4X7Jx+ZwQSRlDY5Wj+Ln47zrXFRe+Eh+Smr42/ZxJkhve8WTY3QxjUk3zxx9UC82581EOoy6bNWMTTWDpGNA/qL/QJXO/weXj7frePXn8tWCDOF37EAmDLZ8P+bYvCYuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=urM8dhWs; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="urM8dhWs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaeec07b705so291045666b.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741940674; x=1742545474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywEbrJtSFC2AqYUcKXRGNHqBvY9/O6csNZBNXCU4/xs=;
        b=urM8dhWs5Y7oLcYQvV6dZx3UhUExNrSuJDeoQJufypl9eYw4jWCypSsOmzdfE83w9Y
         lpftxzCo73kh/iXTa0QDlPDHx3rwnOh8PtKmLcS/t0ygyDNPgBszsxbSUd+twIGcgW0H
         1tKob9Ic/oSHGgI7eedII5ltBV2Qd5BNujIBvLU23BqzGzEia1gDH+s6Hf7aBfDiYRd+
         g1QfojjvqmBE4B66f6BNUu/8pguo/RMd7URx2BkIEwq/Vbq+mudQFGnNrd66WmPBJoDL
         ORKi4Rj2aUtcKcFBBIlnvLJFSNy8b2uj95AS1NpJTcYsI49CKBPvidw/VMhq4l5qqlQi
         o/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940674; x=1742545474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywEbrJtSFC2AqYUcKXRGNHqBvY9/O6csNZBNXCU4/xs=;
        b=LMGNstH/h/o2P/Lk3x/SOKaj1YYGFpfrbn6HCfQXJQ7ArcpbLnMlKS/n8ZWu0EqKyQ
         QBss41wPZL/h6xvqvQumDM+PhqpJFaGN4VZnrGAf2fbVaE9+Lbr546yHEgs2nBCoFtSf
         11w7WuSEP1TBZCu9UK+t2kPqrV7yjddJPjva/XVVz37qfxU7PTEtlAwI6RfMQzmTNmgt
         WmQ8pxyjLRRZCOnnkJDE4/ZSmvJNpKG4zDvdfkiO94u4IPWA+CL8SAe2bl9Eu6NEe/Pm
         GVcJidGiZ8nLRsPXwkTJAQA1N/7izVnw1ZRQnxei2viEgGgc1P4QTaxXyRbFj/1jhFRF
         I/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV2y6tHHyDXON6Rqb507JywPnQ7agFMMPblxsJ74gDXW6P5gdIgwgY6xSSZThFjbaov+MLuyvtTLYnHtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6tDXkf/j8j2T9ccGn/hhHSz9ZaMMV9aG1DVbcg52wCxLPrwK
	WfVZ2KqwI3EruhIW/UOeLpNSkq+I+YjOCqbKcypq1jLsugVYOPLT1zBc79xwNOk=
X-Gm-Gg: ASbGnctqWMch74PBnzobwgq7fpjK/p/HILhTqed0s6qLqiitIUktUzfT1Ak/MgD2ifP
	kLrzaKTG7wT3hNves5zwSVNyNmQOzawDSYdmyqnNuihiQteqKaprGucoUAGUo46oYp+6Z4f1c0U
	iKVUEGZDGk5mhVm92Bd9QY3C0jc9m2SDVqrSR28xbRzPuRlWbzQBiLUzcKlrIc6TtZNfC1AXY08
	Cax2mt+6S94tTuAQB8Ai67ox7vmSbglPqlQR06tzF/nemU/23nSjipfHeyIOvjJIdueTT6WXTrx
	fzx1p8Y85ioASkNHJNbSJM/jjgSWeYorYRS/M7oBNkGQmSLOKn+vZKMei/69e+zWRkZsrsftH6k
	EfLo+4fg3WI6Bp+roBA==
X-Google-Smtp-Source: AGHT+IGTscR7BYFU80Pa4ZMB91BZEbz1XZF1lYz6b8n9RlCmwKKPrDiAzrx8K9+FPXXto+nTQ+ePIg==
X-Received: by 2002:a17:907:3d8c:b0:ac2:806e:bb51 with SMTP id a640c23a62f3a-ac33017d768mr166849366b.18.1741940673584;
        Fri, 14 Mar 2025 01:24:33 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa6499sm188846866b.183.2025.03.14.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:24:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 09:24:31 +0100
Subject: [PATCH] remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAL7n02cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3eJkcyMLA93yguJi3dzMvMyU0twCXSMTSxOzxBRjc7NkIyWg1oK
 i1LTMCrCx0bG1tQAU0eCZZgAAAA==
X-Change-ID: 20250314-sc7280-wpss-minidump-24946ad376c2
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the minidump ID to the wpss resources, based on msm-5.4 devicetree.

Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 97c4bdd9222a8d5324fa3655019e2818f4fd95f1..a78d4292a05c70ccc7ad0b46e641ef45253ad8e6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1348,6 +1348,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.crash_reason_smem = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
+	.minidump_id = 4,
 	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",

---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250314-sc7280-wpss-minidump-24946ad376c2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

