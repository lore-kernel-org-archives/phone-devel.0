Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59641C77B73
	for <phone-devel@archiver.kernel.org>; Thu, 27 Apr 2023 23:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjD0Xf3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 27 Apr 2023 19:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344316AbjD0XfY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 27 Apr 2023 19:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B24E2703
        for <phone-devel@vger.kernel.org>; Thu, 27 Apr 2023 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WAbmGag01n5DmSI3CzgProTjcse9Z3IcWuvX59Ri6Jg=;
        b=MOrWLxFdXApybiuFt3Vg9kLxQUjpXHw8cw0js24W0dO5kftNfGpvhnrX9zVGCxbD4H1CW+
        c3e2+a/eEGAXdNnO8rLVPywXWve2ozjyONJkjHBwMMnlpcu9LTRijqGkMqhzmzOA2bZFSL
        OScKLdzZs/w438dL5EG9FqniadtRZlE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-toIv2D2bN9yuxjkUfUz9Ig-1; Thu, 27 Apr 2023 19:34:36 -0400
X-MC-Unique: toIv2D2bN9yuxjkUfUz9Ig-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-54f88a34bd6so129322287b3.2
        for <phone-devel@vger.kernel.org>; Thu, 27 Apr 2023 16:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638475; x=1685230475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAbmGag01n5DmSI3CzgProTjcse9Z3IcWuvX59Ri6Jg=;
        b=lmX/2239qb1kgjRdl+2YvsPKqlAuADmJFzkpyf2Z2Lf1Zs4VgqVsySv6ROB6+SuYox
         if/J2eiPoOOEcmWrpFErSlB+sqmIvVRhr3G/hWB2MCm/nlohjETHNU5xd2bIf7R4C9kM
         5B7d9dC2pGpCOjs5kgWotBqrT1MS5dCJygpMZtVVCDRwtvq0DHrwUh7kPsx5rHyQ0EPv
         xxl365GwMc9UD1vv5u1L1ZWibTOimV+YoAXze3vmcMsyIh/CvzvzLhGdFeu+PX+DSwod
         sOIj1ialgJ5r4WUBfesa5XinzyhOexFpkfD4Z0UaHsZ9/5xJDbxokfV2fMFe7JqFpxC4
         Bnew==
X-Gm-Message-State: AC+VfDxTCKU9CrhghA9joe0wLhb6YMJl74Dx/Wkx+wrGwhQCnNv4gQP6
        rzyToMPPez5bYfTehXnOvmmlp+ph/3KEAceOHA3nTgne49pe/5RPCYIA/XCi99ayovJXRpLZNMU
        ZoG+WvwnqN5s0301f1s3hTbM=
X-Received: by 2002:a0d:c946:0:b0:556:c672:3455 with SMTP id l67-20020a0dc946000000b00556c6723455mr2381991ywd.40.1682638475579;
        Thu, 27 Apr 2023 16:34:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73hjwG6+Ltq+wLdLn36T+dLP3PI+N06414PCgAVqJLApv/bdsLxACX1f3tsLzSETOMQ8YF9A==
X-Received: by 2002:a0d:c946:0:b0:556:c672:3455 with SMTP id l67-20020a0dc946000000b00556c6723455mr2381963ywd.40.1682638474836;
        Thu, 27 Apr 2023 16:34:34 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id h190-20020a0dc5c7000000b00545a08184f8sm5137345ywd.136.2023.04.27.16.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:34:34 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:34:32 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Add vibrator
Message-ID: <ZEsGiERTqoMJVh/h@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
In-Reply-To: <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Apr 27, 2023 at 10:34:29PM +0200, Luca Weiss wrote:
> The Nexus 5 has a vibrator connected to the clock output of GP1_CLK
> which we can use with the clk-pwm driver, then we can use that pwm with
> pwm-vibrator to get haptics functionality.
> 
> This patch is based on Brian Masney's previous patch with clk-vibrator.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

