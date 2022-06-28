Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCF0CCA479
	for <phone-devel@archiver.kernel.org>; Tue, 28 Jun 2022 20:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiF1UY3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 28 Jun 2022 16:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiF1UVp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:45 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD423D49C
        for <phone-devel@vger.kernel.org>; Tue, 28 Jun 2022 13:19:37 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u189so18768030oib.4
        for <phone-devel@vger.kernel.org>; Tue, 28 Jun 2022 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NQpND458z3IC4Odlss8f+0pJiS4X3ids1xb0R79Tk9s=;
        b=ZRFTwiseNq/07y2wi0OcvM3bnWx2X0gHhB6RFo6uG1Ml786at6O7Yl3fnHiYIYtX8B
         malpAvoCjImS9OETF4JennoN/1ilguvcVS8nip46MtxDXbS4hwHn9Km8EA+ZpBRANU3G
         iLreEV+0MyO5pWjtVoK2I4SQPmKZ/PL5iXdUMEzuoY3ofWBRVNKKDEzYD4FtDuD8jLpg
         91F4LZbIc36AFLa7cBS4UCx3UelRcXruGi4AYD3mby7i+9O7ytsMvO+G1Yy1oABlAmLZ
         sG+8ifPMTgQ9CtmpOvoXdljQr5jWwyBml6GEp7+dLlNAnrm64AXWqOiMBpMMSrwWqktQ
         Upmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQpND458z3IC4Odlss8f+0pJiS4X3ids1xb0R79Tk9s=;
        b=dfg+8PYylQ9Nko7lXjg9ozKdB3H1YSFiNr4IUb7y/St0LN9Hf9ppWBwg2vloN0smLg
         RfEdiC2EtX3kXKt8TH9MQOIsAXBZock5n6bE5zFsoJjC3Vq8ESJnq16+Jc/kVzblIMy9
         9c755wM5tjti0ctQHliRwUomPsrM6dPXegoktrobLIOMvI5DXnJqaB/y4UEEhO/fwaSu
         mCaw4HgMM3vd42J6bd6sqxkAG8rsclRLGu5iv6CyXvVqVBD8NAJB0sct2YDWNBArbeIq
         m+85zP6XnsabwbSdlZ833+k69Cf30C/r0RhqAkW/O3rL7g0/wL4+zkQTarjySAHEfioZ
         Kcvg==
X-Gm-Message-State: AJIora8m2J4Jm7pRNjG/3B3iwXTbxz3mWMuB4JnZ2xzX3QHnFti5rn80
        r7QBvmF6/Knyi5WCxL5NRNWLlA==
X-Google-Smtp-Source: AGRyM1tb2bgMKzTL3KVsVADswXMYQW0RxHDoAaWrKDmNgsaFPiiI8I0xppgl6dMjJpsaDJ8JBUpLeQ==
X-Received: by 2002:a05:6808:115:b0:335:23c0:5460 with SMTP id b21-20020a056808011500b0033523c05460mr890192oie.117.1656447577147;
        Tue, 28 Jun 2022 13:19:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-akatsuki: Round down l22a regulator voltage
Date:   Tue, 28 Jun 2022 15:19:06 -0500
Message-Id: <165644753307.10525.17092818321513559664.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220620211212.269956-1-marijn.suijten@somainline.org>
References: <20220620211212.269956-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 20 Jun 2022 23:12:12 +0200, Marijn Suijten wrote:
> 2700000 is not a multiple of pmic4_pldo's step size of 8000 (with base
> voltage 1664000), resulting in pm8998-rpmh-regulators not probing.  Just
> as we did with MSM8998's Sony Yoshino Poplar [1], round the voltages
> down to err on the cautious side and leave a comment in place to
> document this discrepancy wrt downstream sources.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20220507153627.1478268-1-marijn.suijten@somainline.org/
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-akatsuki: Round down l22a regulator voltage
      commit: 4148a9eeb15152865d60b0913d96beb7ca166f9a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
