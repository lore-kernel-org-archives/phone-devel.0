Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D92F3627
	for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258072; cv=none; b=XwJWUpRyGgvqXQcCMb9b7btzzR79qdoQ4VYOJJGXZwHS49jhOlnAeWhoYEeArVpjCNReojark+T16UDoMofjBfJjUPsit0NAFCvkUgudbWJ7lgDI49hExDjw+EeqzOuJBW2oLTAp1aPIkfe7r2lpnXW3BhrjXoPZB7Am4HHYQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258072; c=relaxed/simple;
	bh=9pueYuEIoRhh8Q7SXjsOxjLRBOEiyf+7/9ZBmo6ZPtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szDcoaTM8G7DV204nCJfB9MgqKpPG9l9CXBdFpOPW/fd6BDDVzmxFt4yXbBfJ4w2Z1uLdvfrZjmtUNVx7NzMrUGVNE2BPR2cX5Pj6CNjjgiPbpRkO0q9TIgMT0KSJcJ1wXlXu9hvQXkcUopqHg4bGa/2ZoI9bqmj3K5ZMftqCgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NU+AYmdS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NU+AYmdS"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32f1763673cso31499161fa.3
        for <phone-devel@vger.kernel.org>; Fri, 11 Jul 2025 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258068; x=1752862868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFonXyBEBu8bBQGRWXHhhJM0VZMeyX0O0WVctxeWjqk=;
        b=NU+AYmdS2Ww6aEAAyX1OFL3gx8fQMdj2FV6y1Bf3NGinK9IoKNI4s/wwdWq1Trt6wM
         Zx0EwUktzxHcXtEplUngRUWRKxGY1nDWp2u2W79DZqKn8t6zv/lUi43WssItoXrnOGrF
         UcB5OxZBwf4sS2l3d+YxdFlf1B/hSCLWarNX6jNDVvKG/i2WPdB9k5NYgp2Z8phscFqV
         GWnf6n8iHEa2VtI5/H9AKNPUue7gblqgGzl2CMLGJVnzABkKTpXH2PqbmX/PKrCoAsjF
         MZBfgpLRR36M/3pczQhVQMozYmPWyRGvX9xDv1hZHHsSq9FNi7rZRK8y9LAmIk27HNqO
         f0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258068; x=1752862868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFonXyBEBu8bBQGRWXHhhJM0VZMeyX0O0WVctxeWjqk=;
        b=wxsEu03GJgUosJAUXysgGvENuUTInjagOPOoBkDGC2ccJVLh77MNPO+nd0OtJ9i0mR
         3aqfhYnu/96W5dKNCGA40csk+XSSnD7jxEBxhIx6vi2GPiHhKVtaPAFXXU5JE2XUB/E1
         AWpEKM5uF5CcPv7mrCvBkFrpZ0oTTE8bzF7i8u1+sPUDJMZgJqjKBT0vbQGBuuJHm1mE
         wN05cJo9FRvUSNV9B9semC8oUwql9XQfiGL5z4XP6OX7IwFbSac3dKtD2dRpZZmkPMUR
         Gd0oGS/Z17OY2XD8Nv0n4mK06C+t3LN6/i2uh6+5V7/S0yssJXsXhfs3NaWToQ5rdp3r
         UkJA==
X-Forwarded-Encrypted: i=1; AJvYcCWj3SzEnnWqFddCf82L8v9Xf/vF9jLxIPGkjCUzI5h/rEptOsfEBaVot2q9EKPxpS+qg+5cr40t1iN0gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1pcgClKBQDFnSRFRW8drykARyL5/0kmrnQES1DIlH+pqFiSd
	D3KjCqV2t+zs1uoYgzN/klCoMAOxEhKoh5XWnuuZHDToZfn/pNOm2xrXycPwFLVQV84CioJQMnp
	cT2aZCoEs+6dLPJdaKZ8eOKonc05ax4TUpc9dARdJjA==
X-Gm-Gg: ASbGncvC/svfpc9wSbrmIiZKk5r3sHzb/b0/de2A6IT79BXrhqGqpyZraiR4Ff2k/zg
	nj5T1WlIhGW+VbUP22ZQhaBRKmqe8O3TNATVmg6uIsxeTGhPUnvuF5i1IXVU0nKhyUUnj9Wz+L0
	EEYY01I8eXnQVbnN2X8sbgUaVVNXl3nHRt8AqJ7dzBa/AmaN6JkoxL69WBJq2rngYCsxA3T7PmE
	o4dz9PrY2BBu/CU2A==
X-Google-Smtp-Source: AGHT+IEvkwHGOLQfSLv38NyMLX/duDgiOrEo48zv9nOud2f/wZg6mazHn+ZXSSe8h4+6KW3mbg6mMV6T7HPqsPw49Lo=
X-Received: by 2002:a2e:a007:0:b0:32a:7d61:ded0 with SMTP id
 38308e7fff4ca-3305341307dmr10521881fa.19.1752258068303; Fri, 11 Jul 2025
 11:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
In-Reply-To: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:20:57 +0200
X-Gm-Features: Ac12FXwUK_6BkBTiMmf0bIqwdADNOgyJE6d12NaL0C0nqmiCzFyAn5E5nDpYZaI
Message-ID: <CACRpkda-ssTEJqcj=vxnz91rj=qYz_rer5p5Db_b=pSdjUj9Ow@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add support for PMIV0104 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Luca Weiss (4):
>       dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
>       dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104 support
>       pinctrl: qcom: spmi: Add PMIV0104
>       arm64: dts: qcom: Add PMIV0104 PMIC

Patches 2 & 3 applied to the pinctrl tree.

Yours,
Linus Walleij
