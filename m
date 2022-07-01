Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F46C433EF
	for <phone-devel@archiver.kernel.org>; Fri,  1 Jul 2022 03:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbiGADPN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 30 Jun 2022 23:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbiGADPM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 30 Jun 2022 23:15:12 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4042D427F8
        for <phone-devel@vger.kernel.org>; Thu, 30 Jun 2022 20:15:10 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id r82so1918497oig.2
        for <phone-devel@vger.kernel.org>; Thu, 30 Jun 2022 20:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BxMVRlozs5gaL5y+tksQaCZPN44sJr80WYAWh7e65c8=;
        b=VuZxcn7NzbAx1RYFKd3d6ugSfHcjpGYDGgiOadaY/oAjEp9D6yvBn8qGzGNmpltxOf
         cROV/qrCwTB7SOajxmHjEv1vC49BiQIWKxvsOBNv25QrvctiLdUugGHZ08AxSG0jGe9H
         Jj4sK30uQv+M3XRx1dBx3pvwCR4AlRb6mAJcOVI0hpd4Y5pQ3B/qTWhIGXT0ifxs9MCi
         yU6idl++JaO9N3sGA7dmTrCvj2kVe3ey0Fcl/ktEzr6R4Bupnm9tN608XyGFCW7EX6BL
         fcUFDmpxXu6bFW58xnqnLgA+Jh4RLE9tN+8PhsFm+TO9hkMSd1pHkMLWq93ieYELBRM5
         3HTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BxMVRlozs5gaL5y+tksQaCZPN44sJr80WYAWh7e65c8=;
        b=d/FPg9KbCJp7H2gjW2ixirAnqAH2tFXqNdiTrorzWvl8mrXSU1s3v1RFfI/a5ft2aa
         1J5dIGM/TlqsyWwWw1kAB/NBHnk1DNp5hYhU5KX2/yZJjGjIBw8HJLxPR4j6zTJaPTWa
         /2re8THXR/YQWjFOObmFpbY5RpVv1SnA5AEpkMRhxWBCt800KrrPbtQwp/k3z6oKQCFE
         SIp+dXehdtoNhDOCQtAkVqW5svVkMtkFGCoPAN42ueigAGJ50Rw7Tpyy9bfxVe1ST5Pc
         o2wgobrSP6RtcFI7r2Z/FKHGOaJizF7ORzYHs4kGQSnrHE9NFfQCsXODf9MaX1A6A6/1
         c7LQ==
X-Gm-Message-State: AJIora8IIs4OkcoRuI3XQAtZUjsxQckbzRyX3W1Oae/iKIa58SFpfyTn
        cAEkNcDxjBG3QWYeBGavVb9dUw==
X-Google-Smtp-Source: AGRyM1ssBoPtQRcmEAjnjYBiorhZ2EAIrmmwQ9Fy88H4Rw50wh6VlhhnIza68G+u/M6FNXgpBHeW8g==
X-Received: by 2002:aca:2204:0:b0:335:5bd4:f6db with SMTP id b4-20020aca2204000000b003355bd4f6dbmr8457410oic.201.1656645308146;
        Thu, 30 Jun 2022 20:15:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o4-20020a9d4104000000b0060bfb4e4033sm12205091ote.9.2022.06.30.20.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:15:07 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:15:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974-*: re-add remoteproc supplies
Message-ID: <Yr5mua6i6WxoAlzB@builder.lan>
References: <20220606160421.1641778-1-luca@z3ntu.xyz>
 <20220606160421.1641778-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606160421.1641778-2-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 06 Jun 11:04 CDT 2022, Luca Weiss wrote:

> As part of a recent cleanup commit, the remoteproc supplies for adsp and
> modem were removed from msm8974.dtsi and now need to be set in the
> device dts. Do so.
> 
> Fixes: f300826d27be ("ARM: dts: qcom-msm8974: Sort and clean up nodes")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Bjorn, could you please pick this up for -fixes so it lands in an
> upcoming 5.19-rc?
> 

As reported by lkp, this doesn't build. Am I missing something?

Regards,
Bjorn
