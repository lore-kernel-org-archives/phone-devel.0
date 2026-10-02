Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F54746AA
	for <phone-devel@vger.kernel.org>; Fri,  2 Oct 2026 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949658; cv=none; b=MwaMxaSI0FAarOsW7MetyHBEstLokIzCjcUATl0CVi0LW4sinrn3lCb6SmrJpYPPnUVkH0ufcJfl9Kr67t4eTzcVViMc70hK29do6aVLlL79F0nNqsrOnf2IOtM866baBVAclTGN4uAQTYW0G8yLzweVeJs07aAON8lyUFu9MaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949658; c=relaxed/simple;
	bh=DRAvvI0YSWAV4/cc0GFAC87VP0z9Cqrr3WrGE8zAh7U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=eblyZ133PwLESNVqjXu/NLre6HiSxMcZJXrVPTR+dgWNoFbqR7fFN+dgIrARWwdb6d3DXqJo60hEBClbzBNeDzwAf3gd1BrYZ1a5e2IYp1u2dxse5lJqU/0ncxtBtuVmHu4yS8pIztg24cYdtwfnj7K0cm4y4GdNd1dXE7p9zM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HP1HFJ28; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HP1HFJ28"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb6b726b5so7228268a12.0
        for <phone-devel@vger.kernel.org>; Fri, 02 Oct 2026 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790949652; x=1791554452; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhuCqWE46Oix2LB6rL8UWqZIc/9YnixRqUY7dkp01xw=;
        b=HP1HFJ286+rFhqKsPXbzEjuG2iTGCEU7Pc8pl0wGKIMPlnHPOKKZdt/ZyMrybieTql
         r3Of7ozbjk1msl8k4BX+kLQRdbIz7MX6Yg6BPs9z+czkTNwn/G8wgiQy9zE9RpnevYqB
         h/EcBngPFSQqzDU2J2XRx9LVVwdqRMqtNknaMZ7zFhBu8e1W3qXNxSP2A3Yio1SSnh9F
         i9PGlj+Vga4n/fDU2yGUkyfP2MpWcZwnA0gWOpWLtSbodM2E8XpYAzy4GXhsBPQETnKe
         Hd1VdPShdQKbCOngVDI36FS14nxUpt4M+hSkx8ImxGtxZPANj/yxURLh2IDP48mF0CRU
         9Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949652; x=1791554452;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhuCqWE46Oix2LB6rL8UWqZIc/9YnixRqUY7dkp01xw=;
        b=BHox7QHDOw4kg/4bCeuZ8xXPGpgxMJPWOVr+Upg2vsPGTww6u0uc9sq1NpUuIpKW54
         /iNY2RerlesCzp56UjnAAXLOsYjvKQ0USXaoWewe9i/cF1PdzWU+r58u915vKPaMc+oN
         HYEZKJc5X/EpyfUxaynxuZNOdU5nR2Ud4SZKgxIEvP/5MFhS7q0HoZp7ig4Boo3i9E7x
         12UFnAbmUWo5zeJG8+pEz50j1WUk1KzJejt9BEA2XgNiFmOgRroYLZ14+a8GvhiI4cRl
         fvKu1/4qHIHoSF9lxOHzac++Nis1snUBjJs0QKwLYThJilB3nednYLP7hSdcja9jW1sl
         z5uw==
X-Forwarded-Encrypted: i=1; AKwUvByC5jLJiNcx8a6g/jJMW+ZUbvd0rlinYBXDnmftkYPqCvjyI4ixZf0RdmuQJmCO93gK8T1q+jP3hQEftg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzJ6lzH5bbw8g/l/u6pg+hm9FPhwjm6AFMgKhdoG5iqvLf9nXe
	9hKJXbTFwJP6v91vnbcdijgOovwTZkrh9iwxOm0ekbLaYKtkCTIRS8RSoHQLE7ivyQHEW6mCZiC
	6OMViLP4=
X-Gm-Gg: AYBFou0ityASThXrgTM4epgAUnOJ1nb3LKdi7OFqC/3OIG8M/4HKVOco9HK8M2w1/BC
	vwJeKHToTq9MUWdatQQty4/EcqD7eu/UYVZbnktrYawnY6eemFpHNjTdRFBEuSKmcvDAEQPQ60c
	osjIQEzeC6aqLPpJ9jI541lvHuRIp10oZaYnb2Z7xfZMylUNVzDxVxzcBkvRp0c0UW7ZAIcwgLe
	CEDmu2NCfBFHMH7U5pqcwMGE5t/mR+r/7+YTz73hLdH80Q3QwI9nXFNp+ZpzV4dX2uGINutIRij
	1MOXIw7OgXFpu53qOcmFVfimxHlBojEwP1jB6OF9vuZWg6btpIyyHnd8wipbnm0Sm5tilApPPV3
	lM9xf8r6IfBzoc3Oj73ZGHoAXPGkNYTBNhwvI4vXuU/itICY3c8UoYKQR6+7EdV6N+xodKZO2BR
	w/u/h3YtQKP70cd+PNyUn4/wGJLh5vdp62olYNFsQCESPV2bT9lcBqOo6/0mPpeuJ/fBJgkH+D5
	oNOUd/9GLYQ1IjG2B/tVxfQ5Lp3LHLstGa//rah0TE=
X-Received: by 2002:a05:6402:3228:b0:6ac:7d0c:2cb8 with SMTP id 4fb4d7f45d1cf-6af9e342728mr1802843a12.30.1790949651896;
        Fri, 02 Oct 2026 07:00:51 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d8a5361sm944608a12.21.2026.10.02.07.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 16:00:49 +0200
Message-Id: <DLUENYYQNULZ.BMYEQYCFZ258@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Add Novatek NT37705
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
 <20260918-fp6-panel-v2-1-6695c4008920@fairphone.com>
 <20260918213518.GA2337779-robh@kernel.org>
In-Reply-To: <20260918213518.GA2337779-robh@kernel.org>

Hi Rob,

On Fri Sep 18, 2026 at 11:35 PM CEST, Rob Herring wrote:
> On Fri, Sep 18, 2026 at 04:40:04PM +0200, Luca Weiss wrote:
>> Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.
>>=20
>> Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
>> from BOE) using it.
>>=20
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@ker=
nel.org/
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/display/panel/novatek,nt37705.yaml    | 72 +++++++++++++++=
+++++++
>>  1 file changed, 72 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt3=
7705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705=
.yaml
>> new file mode 100644
>> index 000000000000..1c796599f6fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.ya=
ml
>
> Did novatek,nt37705 get dropped as a compatible, but the filename=20
> remains?

That's how himax,hx83112a.yaml and himax,hx83112b.yaml are as well,
which I have upstreamed before. I *really* don't have strong opinions
either way, but as in the email referred to in "Link:" the versions I
have upstreamed before have been accepted without issue, and even
discussion pointing in the way I have done things here.

>
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Novatek NT37705-based DSI display panels
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED =
panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>
> As sashiko reports, "contains" is too loose.

Will fix, seems to also be an issue in the hx83112a/b yamls.

>
>> +      const: boe,bj631jhm-t71-d900
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vddio-supply:
>> +    description: I/O voltage rail
>> +
>> +  dvdd-supply:
>> +    description: Digital voltage rail
>> +
>> +  vci-supply:
>> +    description: Analog voltage rail
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - vddio-supply
>> +  - dvdd-supply
>> +  - vci-supply
>> +  - port
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +
>> +        panel@0 {
>> +            compatible =3D "boe,bj631jhm-t71-d900";
>> +            reg =3D <0>;
>> +
>> +            reset-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
>> +
>> +            vci-supply =3D <&vreg_l19b>;
>> +            vddio-supply =3D <&vreg_l9b>;
>> +            dvdd-supply =3D <&vreg_oled_dvdd_1p2>;
>> +
>> +            port {
>> +                panel_in_0: endpoint {
>> +                    remote-endpoint =3D <&dsi0_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>=20
>> --=20
>> 2.55.0
>>=20


