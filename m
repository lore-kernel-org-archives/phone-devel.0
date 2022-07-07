Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA93CCA483
	for <phone-devel@archiver.kernel.org>; Thu,  7 Jul 2022 02:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbiGGCbs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 6 Jul 2022 22:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234909AbiGGCbn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 6 Jul 2022 22:31:43 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CECF2F3BE
        for <phone-devel@vger.kernel.org>; Wed,  6 Jul 2022 19:31:38 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10be0d7476aso16788909fac.2
        for <phone-devel@vger.kernel.org>; Wed, 06 Jul 2022 19:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7ogWT1H+ImLdlMfj6ihg68dfaIA8LvRjdhEJWHmmos=;
        b=Ha1SEmr6NNv8/zaLmbB10i4A3gZczVKzg3ROq8Q2hQZG/f4nn+jzxVFP/9pZSr7pGx
         KkoHRTpPjj7lRZU9lhT8CDlK85qohpzUMHDNCeM2fLyfscQmSmP2Jz/sybBqtxpEZx20
         aRypXM6AO3o5OMMwKK+m3nXQpXZwIKbvoIxWCZ96WG0ezMyd89heLAifA+FGs1HsSCc9
         HGbCh9l2f8WGaauL+fDTrUWFLHFddyfVuBa9eK9JnqGPp0CIyg9ifXLEZnbq3zOns12t
         bnxD4j2Fs8ECG7C5+T9Cj9cmNJYV+j1APEobObYxeYSl7bsfFCGO+TZW14t7MCmmsnE9
         PjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7ogWT1H+ImLdlMfj6ihg68dfaIA8LvRjdhEJWHmmos=;
        b=pbMYKY8poF+MpnBrlWp6FyARthmM5FiU0vvIp7CTFzYupFYQNCO4YKyTTnzDRtAe0V
         fX+1YkdvwZ+RKhdsrcQriHXOtMMR+TN4xlW8ldB0981p8/NLOgxiPBhcXGGjSouVNUqt
         W1RCLW1QCDaDWqpzReEA2pML8GslhzSra9m/UYtLZV3CxjUqTMWeUrdjMAdrqt9qgwpS
         xVe9fJvarOepazsz4Kg1QvDUgSkHbEcCEfbL4e2qRvQdXa7z01e61Pm1mZWYimWL+BFf
         QLm6CUe8RJvvVipavIKsXJ8SQ3TjYYHnOsLgwUzHnfXEzgg9awSd37VlHTMParSMBwmi
         9QGQ==
X-Gm-Message-State: AJIora93O41dMeaNhKoYVw03FE2TpZ2VeWpGMIvrV0zC6ganyrJKy4nr
        XGDfF/2yajJ9dQ1xb/Qi8dcpdw==
X-Google-Smtp-Source: AGRyM1tJ/NV6sY/Sib1jTLGkAvhHU8oaQ91IY8F50p5vMraG6h3T4Vd7wLxb0BPP2Ymd8v6FSyB1BA==
X-Received: by 2002:a05:6870:d627:b0:10b:f479:7fe4 with SMTP id a39-20020a056870d62700b0010bf4797fe4mr1271236oaq.82.1657161097876;
        Wed, 06 Jul 2022 19:31:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:37 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stefan Hansson <newbie13xd@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices
Date:   Wed,  6 Jul 2022 21:31:15 -0500
Message-Id: <165716107314.864223.7777729041436224109.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220626164536.16011-1-newbie13xd@gmail.com>
References: <20220626164536.16011-1-newbie13xd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 26 Jun 2022 12:45:36 -0400, Stefan Hansson wrote:
> Add binding documentation for the LG G7 and LG V35 smartphones
> which are based on Snapdragon 845 (sdm845).
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices
      (no commit info)
[2/2] arm64: dts: qcom: add device tree for LG G7 and LG V35
      commit: 28ae8aa3923c394c8efa8e6439c0f84fa42c96fb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
