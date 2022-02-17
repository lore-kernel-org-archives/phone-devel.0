Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DB5C433EF
	for <phone-devel@archiver.kernel.org>; Thu, 17 Feb 2022 08:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbiBQI24 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 17 Feb 2022 03:28:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237579AbiBQI2t (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 17 Feb 2022 03:28:49 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E231C206DE2
        for <phone-devel@vger.kernel.org>; Thu, 17 Feb 2022 00:28:34 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B3D813F1BC
        for <phone-devel@vger.kernel.org>; Thu, 17 Feb 2022 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645086512;
        bh=vsKlQAxucxoa2YY4aKRE0fk/SvHQXFadLh+06pTLUSk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=QLDibmVjRxSPWimBGs0UGeUFLXeDoDrchFPJeUkxRPX/NXLzYxke8/uWPwd8fHP6X
         Gw4pqPum6CyZ2AXjGk28AcuQcxavNkV4nZforAk54Lt6Ax1vXnRK4pTAmKWmkGy++l
         4xgdcHTTh3GH/stXL7gWbwL9/EMAgXW8ZmYWMnccGDw+u5DLq7hKz1RYSld31MfmSb
         E/ybEa//DC1SlXUKAd2gTXQE34bxrONRzvfSgclI7JXC9MDnJM6qIjXBwgtVCi6QKC
         SXe3pTu6DUW8g4ERh1az5ktmcc7f2Xs4CmCfX/Za4i4bAUsH2Fds+0rbs9xDUibesh
         8N2QS151XFR4Q==
Received: by mail-ej1-f71.google.com with SMTP id o4-20020a170906768400b006a981625756so1194281ejm.0
        for <phone-devel@vger.kernel.org>; Thu, 17 Feb 2022 00:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vsKlQAxucxoa2YY4aKRE0fk/SvHQXFadLh+06pTLUSk=;
        b=XZdAiJPatYji6MH2pALo4e2xngBYzXAEN9pq3oJA1F3R7+Dl3IfoXvtb8rWgfCGbt0
         GDBAxqKW8Oni2vsExTNePCkNWc84gDTIlfVyOavlZ7E+hGpOVGkFR95hQK7K6BpfT+jl
         rwcEkE+dKVMHF14I0Kvp9xaF7yg1+tBiQVGCYznG19ctJsSR7yVlhRgNr8OIWesCXEiL
         k1aS/rOPkQ9e2d4ygySJ7Eo5R8fcg2CUEUh7H5HIUuT5QYLM5cfcEJCE4IlhlZfRzRlZ
         s6GgeeCE7stLMUYXjlmPisZDpuMd1BAl6o6Vb4S39ObDdZkDeRwPLZMHwZjNC7UhO9SC
         Fs5A==
X-Gm-Message-State: AOAM533OzYiY7m/1CWuFdvk33nwZZjngDa8aDf3PnzX+hA2HuO5aPGUX
        1vuBeO7PTGLWBrB5WZn1yCarFwCahyy8H/w0SW1GGWdogjP1tIhVKvXU+OMkD5w8YjNzkBQjm0Y
        sngKBN2wdQ15aTKWt0yMy4a4Vh8LRbgnAfQJIMO9a
X-Received: by 2002:a17:906:c7cd:b0:6b7:a0ea:81f with SMTP id dc13-20020a170906c7cd00b006b7a0ea081fmr1483503ejb.502.1645086512400;
        Thu, 17 Feb 2022 00:28:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzckXr6KyD0D4pif9ezfy/FnPfKiNqcN1LK/vCekvssppptudHK4a1hEy0QishrOp1goqNyLA==
X-Received: by 2002:a17:906:c7cd:b0:6b7:a0ea:81f with SMTP id dc13-20020a170906c7cd00b006b7a0ea081fmr1483494ejb.502.1645086512237;
        Thu, 17 Feb 2022 00:28:32 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id el5sm2816888edb.71.2022.02.17.00.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 00:28:31 -0800 (PST)
Message-ID: <c3528ff1-878a-5a8a-ae0b-524e4f946743@canonical.com>
Date:   Thu, 17 Feb 2022 09:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/2] dt-bindings: input/touchscreen: bindings for
 Imagis
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20220216134302.5153-1-markuss.broks@gmail.com>
 <20220216134302.5153-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216134302.5153-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/02/2022 14:43, Markuss Broks wrote:
> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../input/touchscreen/imagis,ist3038c.yaml    | 74 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
