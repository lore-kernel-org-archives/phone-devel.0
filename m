Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB089391E5B
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279199; cv=pass; b=KCTFZ0eTZWyaNcGfTcNR1oWGMJznMm8gaFMupJ0eRy8on50uH8qW0U3p8AmiFwSCmc3T/NfK/DqXE1hjamjU562BZTJHxqJtY1RjCPGrmWnH4V1GTPARyeubAQczSylzHDvJqG1MRGkhO+R9E4Y+DiIK4b5uzegLI19w/j9xwtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279199; c=relaxed/simple;
	bh=XmooFYO7MJjwuHLWtjcDdWHx87YsWZvV+Cm4GZY+JDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxuiRQjUi2CNk3Dl7INlk9P3XjOuAR6aqb7G2f74jmOwYpa0BvzbUB2WLj9UAuv/S35g2iJJXwjHUHhhYwC7FV0NGe2gsZp42q5+4Ymo3czwU4ZwJy2hn8csjF7+w9eNkMd42qsxhZ2TY//qWNXmr3W/TAs5P0HUgwa1ZUI0lNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTdOWnab; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTdOWnab"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66043ecf6b3so1158211d50.0
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 08:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781279197; cv=none;
        d=google.com; s=arc-20240605;
        b=VGM+rm8hHZOAdGdgXB17aX+3Xn/xL0os5hGZYtZz8dGDSgDcZNrB4dEij5EJ/hUjM/
         kuZLlPSLBw4sFWTDfhv258izJsxhQjA8N/YOpegZJtNgiuM4RgOWv1BrwubLQt9FExNt
         pmHwKP144gnPAs/qd4PvmXlhVGQWDFCH+6aKYCLVbrL3g0cvJoYXfzFYBiBhWM3h582z
         M62SHUDsiORAanrxFk8GIVn4MtoGgUarNBlGLkI87CYvI5XeHquxWGrsXVw2UiCW61TA
         h4zUPuugoeHQp+6NBz6ikjSmIoUvGLLA/7L9CJKCY7CRvWZQq9GKUUyTfAJE/jV2f1TL
         monw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        fh=UFKYso503Qok5xp63x3PZxkNokUpjnGUA2ci2S9ROt8=;
        b=XQe55okRDmvMyeFDfH1lewxlki9ZipHzduwxilXDngqHDfM7L17AqHKRnoUqO1PXS+
         n6+CABLBg7H9e+TVA6QRVZkJxbT5tNiY9l9+o31AlhbU+Be/Is612hujwtX9U+jkLHuq
         l/PyrOUGEi3xsmEeiWV64YutF9wrUe6fujxXvoCOe/IdrSusNJ/03jtQj53x0SvKG9J1
         cP/9Bej0v0eoBg9bO+PYmyHAUalSmFnRVyOa4zEV7kOX3UBT2/6xbN3qaBlbwtcpAbUQ
         yEKvCfqnn3rVpGfaxm/T288rUhpdxVnY71kHC+Gy35Bh74dXVguVtk3MQ8jxaaE6w9iB
         25Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781279197; x=1781883997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=sTdOWnab2g/nh1baVfJVf0+ExYOqQkbNl5HV6c6yysAx848lONEk7gji7UUw0eNKEW
         o7kps/V46c3oCV93vWiFfICAnW9P717fSvdTkhAIiAqS0Tp9xSymDxh3R5vJtXW1k1ay
         M0ysBRooR/T8j3ywyOmOKbMkXAQnqbTNvILRo5gaTS97d1skNh4u+qOK3d101FBtYkEw
         PjjRHvmHhcsN5pCWiNoikggYRCivOyYBtGmEFJC8ZeOSxlgGHQ7DfYFKPwjjUqcTaxhB
         GXKXJknq4PtqUkxAmcK4lZ+EqVwlXgNs2ST1uOj5ghTFA2W9fFbTNcXD5gga/3vRN3vD
         GLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781279197; x=1781883997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=gw0djs+D1f1WmNCYSgHkysuoMH4Dx6JaI3LTh+ctsElysT8zal7vc6bnI1I8NxRg8l
         fRGid+UagTNQ3c+npTBBq1twbATyenhTkx5NvHVJZD1G42GRjrBr8yVsp2sf1phrpo/P
         p7SQRpBk+7ISxjKyS1jd4Nxhax9TIw7GSG56eiWctv4uKQfwjmx9itmnFmRwB+M1fbQA
         OaLsauly/cNVaOuu/EqSPQ6Vwz4YhZWdu8MY472QGjVPXuLeEZjTn75qGUWc+kRtjKfq
         pJ5I1iGjkDz3/GF56wL27SmXvWhAg7ffWIKcFQkwPUWWBtE7S7eskJ5vQzkLmOoyfJnO
         JPMw==
X-Forwarded-Encrypted: i=1; AFNElJ9CMIWBEK23aJZCqRKRw/5TxrqIGdBfKKfl8AE6uyhDguEbf9RJGQToEC/WqXbyvc3H+7zIX4dnCGkjpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6ImW+knIb90tHxpZnu3lxKJBB03+n1L2e2ewgX04m3VwZEjS
	9RAiSFLSqRDQk1r67JwoMq6mz1aqxWYNFlh8f0xE99egzs1156aHeFImnPCYOKVX8oIwUMix01Y
	39MVji36IjDgXuPSHfWt//5i1xelm9LU=
X-Gm-Gg: Acq92OH3GJ6ZsZ6LIQ/GxBiw3ibG2BGfTIzVtzUwp4rvXoK9PZL1lZD6B/qIlskeaD3
	yGDbmslRDpySGUaaIQ11NNFuUNih/kmBOPg5tUqgIrA/WvZy1oUDn6in3Eg04F0secXOUhTKm0g
	FxrjCqq201voAf4WeXxq5Sv4GbB08KTjobtp/gQckbL178zOSQOxX66hqVd9gKqCNXNKif29zg7
	MyB/r449MvSnvOA0kmvk8WJFcmkodAb/dRx2y/DPBjVxQNI/ImQl2sRybm4BOTSlkFk8YL1MhvD
	FBD0rgj33dC64ifn8zDYlJAQ8qXuF9F6rctdmVN9tAqdkIf6I8CfbFauhS8sFCgcgOQrag==
X-Received: by 2002:a05:690e:419b:b0:65c:7129:5c66 with SMTP id
 956f58d0204a3-662782d4c92mr2935747d50.41.1781279196694; Fri, 12 Jun 2026
 08:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com> <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
In-Reply-To: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 12 Jun 2026 12:46:24 -0300
X-Gm-Features: AVVi8Cc-RlrekTPykssUtkucAEzJ495V9LRVQKNsNE6WJFZ19JGNTXkFLsVH6_4
Message-ID: <CABBYNZL_FmgjOKP-rNzc6e=m8oHdzN=7cLbvLqcHi1Otpa8puQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <AKoskovich@pm.me>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Jun 12, 2026 at 11:33=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> Hi Luiz,
>
> On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> > Document the WCN6755 Bluetooth using a fallback to WCN6750 since the tw=
o
> > chips seem to be completely pin and software compatible. In fact the
> > original downstream kernel just pretends the WCN6755 is a WCN6750.
>
> Could you please pick up this patch (or provide an Ack if you want Bjorn
> to pick this up with the rest of the series).
>
> Regards
> Luca
>
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++=
++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn67=
50-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-b=
t.yaml
> > index 8606a45ac9b9..79522409d709 100644
> > --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > @@ -12,8 +12,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,wcn6750-bt
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - qcom,wcn6755-bt
> > +          - const: qcom,wcn6750-bt
> > +
> > +      - enum:
> > +          - qcom,wcn6750-bt
> >
> >    enable-gpios:
> >      maxItems: 1
>

Acked-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

--=20
Luiz Augusto von Dentz
