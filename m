Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8320422A1EF
	for <phone-devel@vger.kernel.org>; Thu, 27 Feb 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740652436; cv=none; b=H/Vc4z8/mQkrPUMEdv8Wfl2lH/ysQD+Or9Vyok/SY20xt6oztyAKleVetrCluCJKuULEfaiqHfG5zNrjpAajZfGrjp/dElopQBeSRjT/Lb/DV1IFMgIvczlPXDKOYuju7Oy1FiKLyeVaP9ouEPybnbmpgYu0Yb+isX5ZRImQJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740652436; c=relaxed/simple;
	bh=Xaj4oMjuSjNjpSa3ETbZtATmjQ7K0I0WckpYcuhf1ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tb8tqheN8P9JREoNatG8haMJGz+og5qLcyrR7bMa90gfYKjwGyjoYsrFrUfNBM61YPob6kuGnKFPYhjlChypJrBGu05AtWsPmkv/T7sq//+MQ2EWYjZuSuAf2pQe/zA0Y+CZrZ7Z5PGvYbKUtnZBu0CXko/kx5Pf4iZ43216+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SubI7WfL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SubI7WfL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so5174245e9.0
        for <phone-devel@vger.kernel.org>; Thu, 27 Feb 2025 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740652433; x=1741257233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kV/+mEBoYkvFSCaizpCuqTX8PtS4kw7sxZJGfAJUIw=;
        b=SubI7WfLLOXCfqidbCuBBJEE58WiPBSloJKxTO+BU+QWzxpXlQ3zWMBVRf5rQatEU7
         RymSShOIb7YGMaHaqg3zGfX6SaaScK1KmrksAVSxI009Su6+AWLcmbK5BNBqg7TcRYAg
         /3qO38WSDyEn1fLsNgq3JHLLEVcPiSrPK7saiFkMS/9DRTNnnCZChOZSVJIfYEdLjqK1
         WEsbKDx3BzbGSOvH6k+k281M+zFDdxofOKpFDOQ1+yCHZY+ovCCeZRdB2xq02Znd9Qrr
         N2yuBje4zAEkrxNBDUbCkg3Bn797hKpA8rD1+5FzjQ10pjuhBBaqnlDAO2XHtXx+47Co
         LG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740652433; x=1741257233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kV/+mEBoYkvFSCaizpCuqTX8PtS4kw7sxZJGfAJUIw=;
        b=HuJwnl4f/FclVQsWFGQ836a+FSbZ2ktnTxapNhJARlXDjMI7AZnOzatAMFzg+BhafL
         KiGJw1Aa9T4xi8qTQfjROvUh5QNK0OLRUaMLxLRXN1+YdegDYMxtKnvkANdlLdXp/G3B
         3mwZJSXNGC2Qd1VycaIibgpgK0LbewxCNdeesXHIeY3Ie6bnt8KaDquseyVdmZ7eeU5j
         JKQJ2ox9pICM01ONsJYaw9BEz3wYIE2vIT+ejeBo7Mh2a1vmghtn5GWnUysr/oO90KT/
         1149KJ/B2d0YEzbxIGWtt7vAW1gCBax8qQUe1joyGZyUtVMw8inrJpZ2ne5/Sc511StC
         hhxA==
X-Forwarded-Encrypted: i=1; AJvYcCUDWbCTCT0av9tARWpAcogJpWe1NO02scGWVu9kH+OX+Y9OkGIbHBhYVj86m3GJwmi4F/plbzwF+V9Shw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6r0iodCmQTJt3kW1gxDcs7x+41vA6tUpgZU/OSujfJFiTOvoH
	nlgAXAGCBWFXuOXm13pzCkJJHiCT/FzoMuprEtWCICTl19XcypsitoVpfXUB1oY=
X-Gm-Gg: ASbGncuQhNe7wNxbOAFxMChhHF7hovgD6Xmih1tIKEDiuqT5SiBL/0RSUAQrqyWKbZ7
	MnJvVV7onCtbvHfF3Za0NsiK8YSg/4dCxBbfrfy4ZkqpSuC0gN/s+sjIX752tg1jMiUoO1oPtQS
	/64dhfj5BhBEtpXMbg64qVKkVQb83AImDYiNBzDqCiLOUVDFNPR5qJIXOIPWCTcbobKHtdBfxnG
	A3EXbjiUQUcc8CBIz2ezpihGKbenmeOwbeFaLs/Y/jwGO2+j9M5sLpk8W2AJ/8RLjG22hljN7dx
	8hYlU3nh7gVNNfzdK2M4LxWo9Q/QSGsSM3xltlS4adNxXbGO7CBpZa2yj4v7OZADDsNc74zAR08
	=
X-Google-Smtp-Source: AGHT+IGUfMm+wQqSIMbXYaeRiTXSjbtLUzOin3rGEggSO6N1QUyFM5nBpMlk0cSmhBIeKP8kb1PaJA==
X-Received: by 2002:a05:600c:4507:b0:439:8e95:795b with SMTP id 5b1f17b1804b1-439aebf38b2mr220117645e9.31.1740652432678;
        Thu, 27 Feb 2025 02:33:52 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a27ab2asm17854305e9.32.2025.02.27.02.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:33:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 27 Feb 2025 11:33:42 +0100
Subject: [PATCH 3/3] net: ipa: Enable checksum for
 IPA_ENDPOINT_AP_MODEM_{RX,TX} for v4.7
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-ipa-v4-7-fixes-v1-3-a88dd8249d8a@fairphone.com>
References: <20250227-ipa-v4-7-fixes-v1-0-a88dd8249d8a@fairphone.com>
In-Reply-To: <20250227-ipa-v4-7-fixes-v1-0-a88dd8249d8a@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Enable the checksum option for these two endpoints in order to allow
mobile data to actually work. Without this, no packets seem to make it
through the IPA.

Fixes: b310de784bac ("net: ipa: add IPA v4.7 support")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/data/ipa_data-v4.7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ipa/data/ipa_data-v4.7.c b/drivers/net/ipa/data/ipa_data-v4.7.c
index e63dcf8d45567b0851393c2cea7a0d630afa20cd..41f212209993f10fee338e28027739a7402d5089 100644
--- a/drivers/net/ipa/data/ipa_data-v4.7.c
+++ b/drivers/net/ipa/data/ipa_data-v4.7.c
@@ -104,6 +104,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
 			.filter_support	= true,
 			.config = {
 				.resource_group	= IPA_RSRC_GROUP_SRC_UL_DL,
+				.checksum       = true,
 				.qmap		= true,
 				.status_enable	= true,
 				.tx = {
@@ -127,6 +128,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
 		.endpoint = {
 			.config = {
 				.resource_group	= IPA_RSRC_GROUP_DST_UL_DL,
+				.checksum       = true,
 				.qmap		= true,
 				.aggregation	= true,
 				.rx = {

-- 
2.48.1

