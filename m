Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F281521A420
	for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736808; cv=none; b=nx72CPLP1r703gsVtOuyJt5umz/Ll7VteJdIV23quVTz2VbyC9FH6x7qHLtjnEAZwBj+6fLCYOc+iVz3/XGMv41o5n5Mt1RU0whGkjBlRHqr9Py3yOB+Y/6zLYhoVF/7WQpxxp5W82R8kYJqEsA39J0XdLywdrUtgwdTe3NhA54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736808; c=relaxed/simple;
	bh=1aZeis3vma/ediM1poNKu6JuGfB4CaNR4b2CAxnOIck=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=OSTEYO8idIgdf0OuzVrQFmKo+ObekUeKCynQGMQr/f3nE19Ec1hA9osp6uP0+s8UMbKCQkhI8K/yMd9IetT4Y1w8D19JKiB5ithKDaeX2/bZoaQxI9SApHDrWuWVnYXDRfH5tKkgHPsqOlN/yiQQIb1ZIKYyIxhmzmCbQZffNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GCNZBWW0; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GCNZBWW0"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1143596a12.3
        for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752736805; x=1753341605; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds0KxRVsVnCi5GTnUrpIjwbuU2zKD6tXzYfIxeDgpac=;
        b=GCNZBWW0UIEi/Tde8UD5c03KWqNPqmCEdasTU+f/XNIGCV6uMCI/69L99gyXhoVp/w
         iRVwRv/SZ3dLQVimlgxm9tRJzObiTGIY+AjmEuAkV8Q0+KpTK7aBJ6zcGOyWmykr0sH0
         r/YVRZsMABhNlI6Ic34F0QKDILB/OIyW3YEcdgHmQH1t/cdTtM9X5uLWcyYUdeIsp3wW
         aoqzH6hSQ0LjAGAXuQJlKTbjzAj2F10i0Lpl/5lNMM/u7Hp/5ClJWcd0bDw1CKYKd57K
         dCJmClD8+KMgvxt4HJA5k6ZWfUFvX4lWwKsJX6ZlS8SJANCsiZRMSXOBHpw4UF8HalEi
         6XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752736805; x=1753341605;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ds0KxRVsVnCi5GTnUrpIjwbuU2zKD6tXzYfIxeDgpac=;
        b=HAEDazPhsHQPDfLn1zs0IdxsWsYQmU9sTfq8adwSEORqO5Cg1cq+JnnGyk4fLApomU
         m1+/qleDSrusPuc0Ga2KjrsigQrKBLyLa7b3a3RMHNA6hoQCSnxIxSfg9jA5+p8ranlB
         4l/sReQkI2qYfRKBGiPb/oXI0yHlQLEoQe/bwyNUOLM3J/8zvkV3mjDMsl6qDybMVpuu
         R5G9vXz+ErvvyaedZIgqfLWtVal7KDOUZSBY7n3G7qU6uS+1/MLGXINrQROHBHoE7/VX
         +N1rLYnTdAWZapY8jJdmsLCOWb2v/Rj7DannFUvPFiqGp8tB6tysn+S2eYxK/V2wImJK
         tzWw==
X-Forwarded-Encrypted: i=1; AJvYcCX+EYIt6Yelbzc+pBBwDyJ0yEMxHIEX2ajJFzxZuZYc4MS5+6AOehBPJ8vOViH0bUVlU7zAUX91v2UPQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3KbW8KibJrdc1B9K0cAYy4MN3EVGJV05KjBu7qxT9Jdbt3hm
	HeY+mJpcjpcmy9zH49UJAVaBEj62cOadczXCVnAG7Lbp232nb5QJAhf+meqdOqu/Gvc=
X-Gm-Gg: ASbGncsRMHwzAV0/819Vrcf/XycDbciPVpWLALBjIugQkZ6jnACp15D1V4kB6Q2Xo8+
	yq39TVWvgVMY3CpGJ1xEve8u/ai+6NbNxZkJnKwZVomALzciW3bYFnTMe0XfM4BvHSewvSROMB7
	f1tBdBrrhwnmWIz8go0/MiyhH/j/GT7UTyfm4Nrw2o3wCHlWQpg5xAEff9kUh+BwMn4lmOVvqam
	2+v0x3Vm++n+A0O3yBkecaNf2b+qCVK0XadgA8tmsnd/Q/9Te2jjmosbx5LyLaE65N2XiId/rDn
	5pIT7x7TI2NJHWS9MkEJAJCMNXIOOTgXa2dYzGayQ1TvQJxjSkM/g+KnaRoXl1G7vM5I43RtbzC
	uC3XPoQFkIEhC3/oLgqpPMZUzSato5/z6eXAprni0egCQwwiHLD8jje0I
X-Google-Smtp-Source: AGHT+IG2hDv2K216WzVbMCe0wIlm1Ij0bAYvzV4KV/5gVYFra+yeIkTw2eBkNA6ZcZTCjmFQQ8r8DA==
X-Received: by 2002:a05:6402:5243:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-61285bf5095mr5097862a12.34.1752736805170;
        Thu, 17 Jul 2025 00:20:05 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611ee1716fcsm8066563a12.7.2025.07.17.00.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 00:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 09:20:03 +0200
Message-Id: <DBE5CBN6IUD7.B03MK0X9PDFS@fairphone.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,milos-pas:
 Document remoteprocs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: <devicetree@vger.kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
 <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
 <175210021011.3927964.2963774922041119366.robh@kernel.org>
In-Reply-To: <175210021011.3927964.2963774922041119366.robh@kernel.org>

On Thu Jul 10, 2025 at 12:30 AM CEST, Rob Herring (Arm) wrote:
>
> On Wed, 09 Jul 2025 13:13:07 +0200, Luca Weiss wrote:
>> Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
>> (e.g. SM7635) SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 ++++++++++++++=
+++++++
>>  1 file changed, 201 insertions(+)
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.example.dts:2=
0:18: fatal error: dt-bindings/interconnect/qcom,milos-rpmh.h: No such file=
 or directory
>    20 |         #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I forgot to mark the milos interconnect series to be a dependency of
this.

If a resend is necessary, I can add it in v4.

Regards
Luca

> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/binding=
s/remoteproc/qcom,milos-pas.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202507=
09-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.

