Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F2BC77B61
	for <phone-devel@archiver.kernel.org>; Thu, 27 Apr 2023 23:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344462AbjD0XbY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 27 Apr 2023 19:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344487AbjD0XbF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 27 Apr 2023 19:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8D3272E
        for <phone-devel@vger.kernel.org>; Thu, 27 Apr 2023 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EVstEm9h+f8vy/mEV9sr+uXiJuKtGJYBIssk81uyPSQ=;
        b=OIHTp/UyyZBqmXSjR3cLk3i+hamcv44jyxX5XUFSrVVF5uyGw38Kdbz5grrgtiu1PqbKP5
        ZVgte9bBzxGu6YFIPsjehXaoFwfdb0/yPnWT1DfG+eeDsB5fzlmDsgGTulg34JyynA8sXY
        iHcy1drSB1m/y3x481ohpWgW7rmPkDY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-NzzrTN3-NCS3OdNphTEybA-1; Thu, 27 Apr 2023 19:30:16 -0400
X-MC-Unique: NzzrTN3-NCS3OdNphTEybA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-54f6da2edbdso143082347b3.0
        for <phone-devel@vger.kernel.org>; Thu, 27 Apr 2023 16:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638215; x=1685230215;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVstEm9h+f8vy/mEV9sr+uXiJuKtGJYBIssk81uyPSQ=;
        b=UaZfQ2j0aTLd3IiHrqUcUgNhQi3aT/DDe6aK0IiX5X/djTVQkQ1Z9YWF9qd/TRmyY9
         eJcPPgsl4POVeeI8tZCwIqhzB991+e6JT4PnTw9UdScM20vlxOTYOY/ovPBlb5SRwgx4
         FmmSLZpEltBjRsX5SJK3sHhJ4HNCi1tx0k0I7UnIguVCyci07tw46S8LpibRC/NDqUOH
         uOkY3GVoxloT2jcAzTlOguUjKRubsUTPMi6Z15IxRM43Mqz/J8NqeVBMrlrUtTubkf5Q
         oSSDNU45HoHhF+ph3GrpQtcN2gGdeA2IaxMcXq3usbyysRCsXca0wEBL6iqT8aF/sCAM
         DCgg==
X-Gm-Message-State: AC+VfDzNnZ1JkSfJUTnsvoHhAuePFWcazXxEXDvvJVnVbhem4HdyRTws
        +eMKyv1TwROcHbVC+FkjCgxHbJqCH3NZA08WG4Hx3/yahxsIgWMtga+t46xXH+8A4IrqcB++gs0
        cmbxcTeYmE5qMsPrcjqmeYdc=
X-Received: by 2002:a0d:d8cf:0:b0:544:5b63:b956 with SMTP id a198-20020a0dd8cf000000b005445b63b956mr2652650ywe.8.1682638215739;
        Thu, 27 Apr 2023 16:30:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AlF6UPNRzq0q97LZdRYbg5r+sonNynDI2yOTx2L/mRwUr5sNyCxdgQv79FQ8u/uf/zku5iQ==
X-Received: by 2002:a0d:d8cf:0:b0:544:5b63:b956 with SMTP id a198-20020a0dd8cf000000b005445b63b956mr2652642ywe.8.1682638215497;
        Thu, 27 Apr 2023 16:30:15 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id k187-20020a816fc4000000b00545a08184b9sm5113278ywc.73.2023.04.27.16.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:30:14 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:30:12 -0400
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
Subject: Re: [PATCH 2/4] Input: pwm-vibra - add newline to dev_err prints
Message-ID: <ZEsFhOKHs6yGLizc@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-2-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
In-Reply-To: <20230427-hammerhead-vibra-v1-2-e87eeb94da51@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Apr 27, 2023 at 10:34:27PM +0200, Luca Weiss wrote:
> Make sure all printed messages end with a newline.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

