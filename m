Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20936CDB482
	for <phone-devel@archiver.kernel.org>; Sun, 15 Oct 2023 21:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjJOVMI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 15 Oct 2023 17:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjJOVMH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A02D6
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 14:12:05 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-406619b53caso39304325e9.1
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404324; x=1698009124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Huhh/OlwpXkMpXKcwHwnmwV8YpnbusYc64GlhC06k=;
        b=DRf658wDkUo/Cq3RXKfR4B3lt8c95B7YfnB3NEWGf/S0audpENPlvJqHwK7ZACJeOX
         UN+QixYdjK85RDnRmTeBcejdT1lDkINEikr6t+1hlRzHkvf3qUeiPdKKVfW/JCWhzNOj
         vmrBECazML6dGWjNxQpuwfB7yBh16I3IsU9zJWoCpqaSTdE9W+wD8jLmChSdUOqiyDyT
         lKVS5HicDrEYAukl9mfqn5WOMRW1WAyYyxGQ8jk4cZYAyaKHlNxDKzyamynBbSiA16FC
         hM2U3uXPzyePbjNMRdUmkVGLMfhoscwRcnyXDgvtwTvM4N3Wd6lqfKZny/LfkVamqoga
         atuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404324; x=1698009124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Huhh/OlwpXkMpXKcwHwnmwV8YpnbusYc64GlhC06k=;
        b=wc6bpCl0dcNvdkzjmGVlzicmiq9cPhhVWZ0OXpTs3/nKsEMySjOQZCViCxPNWbUB6j
         pepzMx2ngK74b4gJeCi96NWnQtjs2WG/siq0gex8F6ZxrHpY2IPuq3ak/A67ENkktPNM
         n0x/Ym6pu9AymZyYlJYDMdcwcty35U4zAqiDoDb2sxDm1Ha1jPbgL3m/lyJfHIXug7J9
         TWruV1qF7y83LK9dDPYH46jNsJpQ5pAV7fL/G0SLSxCQZDINat96SugW6jSaaD4z5dxB
         RfaDOrMWvcTykNiSpCPKnXe7fz4Llb2nUFnCUONmQ0bUZ69LHxNmShU0ywfHp1/rqU6l
         7LtA==
X-Gm-Message-State: AOJu0Yxfns0mfyeLtigr9O9UizSwS9ifDMRRhhR4BpZLpsthj45T/4Fw
        JoEVup87GEcrs17y5yq+QhHNPA==
X-Google-Smtp-Source: AGHT+IFd5LFspYZaIAwsfZI36kiOt4XmrUk4/kAFw3O4e0aQmvqumoqek4alpFIfgO52WOmTe1xs3g==
X-Received: by 2002:a5d:4534:0:b0:32d:a3a0:e927 with SMTP id j20-20020a5d4534000000b0032da3a0e927mr3677866wra.58.1697404323892;
        Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:54 +0100
Subject: [PATCH v2 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-6-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=pgIIB7OL7EFg+Qrqe6fqxDg+RErXXrlo3Ql+ExoD2SI=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0Lk//jQ0Xbyaa3CypEZL7anF1UdBe6VEuVdE3KhV8
 hZvidbqKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABOZ1MDwT/ns7u3z5vvXcLwR
 m/XI/XzZGh5Hvm/lVduMb8sa/xbs2MjI0Pd8GevCNU7HPP5pd6bOiteqEUgW1K1++kp1gtpFg/V
 l0wA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which do not
report the product ID correctly unless we read directly from the
product ID register. Add a check and a fallback read to handle this.

Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_f01.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f01.c b/drivers/input/rmi4/rmi_f01.c
index d7603c50f864..4aee30d2dcde 100644
--- a/drivers/input/rmi4/rmi_f01.c
+++ b/drivers/input/rmi4/rmi_f01.c
@@ -250,6 +250,20 @@ static int rmi_f01_read_properties(struct rmi_device *rmi_dev,
 		}
 	}
 
+	/*
+	 * Some aftermarket ICs put garbage into the product id field unless
+	 * we read directly from the product id register.
+	 */
+	if (props->product_id[0] < 0x20) {
+		ret = rmi_read_block(rmi_dev, query_base_addr + 11,
+				       props->product_id, RMI_PRODUCT_ID_LENGTH);
+		if (ret) {
+			dev_err(&rmi_dev->dev,
+				"Failed to read product id: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.42.0

