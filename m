Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D45C19F29
	for <phone-devel@archiver.kernel.org>; Tue,  2 Aug 2022 07:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbiHBHmG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 Aug 2022 03:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235904AbiHBHmE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 2 Aug 2022 03:42:04 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69797BF76
        for <phone-devel@vger.kernel.org>; Tue,  2 Aug 2022 00:42:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u1so10512768lfq.4
        for <phone-devel@vger.kernel.org>; Tue, 02 Aug 2022 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sysyo3Hcj22F2ZNqhVMjBOijG52otySUtY94FYZTrsE=;
        b=tln0P46UzHwhOXJDiSbb9fJ2gkC89F0BJrUFmi8BOPk6lFsfs2KF/NtKmApzE/ubzK
         Bs4lNbIghDHV7lZRrS+wsfo/RkV7VtccpmAbkdq2KrYC1X033mc9Psquly1rXOo6d59L
         Tp38O8Ig6CZHOKtJowuZqA+QjjSHCNSfwON790kkS26iHAcXu1GK8kLeEtYp9dhdVTNx
         rUriRr6nNjxJOF7s8Iousz/WfeoJ6JPIFtiw464QQfqlzm7HskZj6UPAoi69LNzr+SLK
         Tqx8E8Fbi/2CjFJMY9dSXhCJY/bmWCOVOHzcfu3mYb+nW8ARgsatmlap6lwFfPYB9X9F
         /KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sysyo3Hcj22F2ZNqhVMjBOijG52otySUtY94FYZTrsE=;
        b=wvAO/0ZPU+0TFc6uarhCQ7bhBw1ZsR+ysC3LrLr3ir+eXA5Q6nvygT2q5MSFc6pFod
         3xdFrOewW/2MxV9LXitbHHW8WPbvF2klfLybe628ljCC9bxjlODscfoK8vq/pCTt6Vqo
         afv4p5dPeVSfXEueswVlyR6f7Ham/tBJ8Duu14ow7OTZkYVEM59ANTW+j2KaTKHoNoNA
         SQYH1o01ocufhRfssjcVWYpo6teQLHMtN5u16qd/fLAs21kw+lqoFoPY8TAKXp81ktNb
         XvCs/kHlmoASD6f38pi9GRG7NfzUc0iToOuNdBzvLti6fAHb0/oK2GFCUzRUxKD7f/8a
         mAFw==
X-Gm-Message-State: AJIora8jzgANQha95gPdTlQqXp7WQquySNCXN6XTzN7R4cVXRKVeqle0
        tv7Bcdo0eIoNNr7y/MkUa6YcrQ==
X-Google-Smtp-Source: AGRyM1vx+HsE2Tt+ENrRXaGDPuG0vy0jPqLUUb2AczZFIMg1MAjBv38zLnvzU5RE16RnuuAAvqiZrQ==
X-Received: by 2002:ac2:4e0b:0:b0:489:d4dd:20cb with SMTP id e11-20020ac24e0b000000b00489d4dd20cbmr6837487lfr.83.1659426120829;
        Tue, 02 Aug 2022 00:42:00 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id r10-20020a2e8e2a000000b0025e42f8e771sm1212528ljk.34.2022.08.02.00.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:42:00 -0700 (PDT)
Message-ID: <6acad958-54e6-b535-bb16-6364023547e8@linaro.org>
Date:   Tue, 2 Aug 2022 09:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 move common nodes to a common dtsi
Content-Language: en-US
To:     Joel Selvaraj <joel.selvaraj@outlook.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220801112512.209047-1-joel.selvaraj@outlook.com>
 <BY5PR02MB70091276EDE0CE4FCB6CFBD5EA9A9@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB70091276EDE0CE4FCB6CFBD5EA9A9@BY5PR02MB7009.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/08/2022 13:25, Joel Selvaraj wrote:
> Since there are two variants of Xiaomi Poco F1, move the common nodes from
> Tianma variant into a new common dtsi. The EBBG variant will also inherit
> the new common dtsi.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof
