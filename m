Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA6371048
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274798; cv=none; b=scOoq5waXIJvG5095vGjVykdiobcFk//c+1at4t7hhsPqZHCOrXaozvt8f7rHiQFjCKuZoF7XC886xOfmYZw5cUBIcNKBogqSq5WXoujDHzXs8c+LVYmF1W8QFIiYqOA4lVYPyZ+078PB9KcydYE65oq0QMh6J+wO+rR8Y3Uayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274798; c=relaxed/simple;
	bh=tMuFqRJtSjW/BtSIGP7fEghEyWX1qeHJdf7t1D8fGrc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=i0rk7QiAmN/ZjmSsfUe95FU0E6dLrB3dHBVTRGoIo3JQ6eG1mw4MNwl4VBOV42eBZz2glJlfnv4CHTPpxmyIIudk2s5jzgoNikGQTtWHBWCJCtuadneYii1J0WJCGuwv6FBEGXf8i2UzerkrZ0Wbemi/UC6QeuTCjQwlZNhCOcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nD3x6+aw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nD3x6+aw"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bebc80100efso112172066b.1
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781274795; x=1781879595; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=;
        b=nD3x6+awdWyy26Ksyt968dbDCZ8Qpn3bIemKFD9LS0X1++6tQ7bvece/nKWDtBtsuh
         hAt6hwlxDXWWafeDGCRENBNqbLHjOh/UNwv0iLHubDlDHbuq5QHbFLd0g3YOecbEEs5I
         K7WfYomB0W/2J/mgxj1vAVocYnyhyZVMWWhwhtT0c8FKb+T8jguBpLQaIapdJ5+o7LU+
         r1cfWuq1CBr16kFmSjod5ZToTQWKHsIQA6TdalfCugDvV5kqpRY+UjM9KJF0m63Pigrl
         D3QZhb+LfppCTRo+aeuXi4ulSWlnv0K5lEHr/TYiamrkbCpwsB9qihEdl7/XTxmeJhiu
         MyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274795; x=1781879595;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=;
        b=kx3VymuO61E0AupBAu8CHWcLRkOcU6iyYAKAedHx/dCv0uXZNxWkFJG/igMYQtTBJL
         G+1K7GbJV/ANZbJRCI8PL8cFCj8jjvnm2fMiLFMSFdelTr2gsyjy292St5HarTg5kRT9
         rKKLkNo3x5w4l56fpXdyFjh1C87amHZQSVns1P6g1UhsyipxWUwCngP8BdNTOjI5nHEu
         vpAadOBYR6cXWCZIg1IMnn/XylY+qrTbsy27IT/3lvKa+jSc6hi4gSYAajwgT9UeZclt
         KxJqdFRSFwqt58dVKnSPJ5XA+untuTHia4D21tLx7+xyHAHo7G7IBWX3Uxsryai0ZTdW
         xloQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q+yigfCErPufpdC0Thppt4Y3t17vx9dVKskNvBKOo+7zY/NV2vzt64TbG9wlsdVPYQ/zTZ7MbooDtvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KWAsup8fJlcbU38R/ESk6GD2JvaLLv6Bj+pvghSJjogHIEsz
	7EaiEflUk4GGNNjEHqqhisxvyTeFo1fxmxQnfqwTlz7Luk6Cp/lqz4HUsGASC+ah2i8=
X-Gm-Gg: Acq92OHKCDWlaFk6W1KQt1OtIgQv0LcmjWSNc6bOK+zBxN6RvLAL4VpI/enBtvkXPL4
	EzgePp4ETDesdJFMuPZWTFY7+gFw1hmCh1UUKVdYt1+DGHEFTbH4Fuu3v+i0CyLI7TrF0mCtQrF
	eEn8SqSH8DcF1BeWj2+5uPGXJ2vDooT2Jz0B4mPWBzGK31FcGXOrRJiPBRKMDxus9q9ejUr5gSb
	dhV0nJrvaCztmkafVfHOqOFeVIGWpHdtMUnX0vwDwvO+KEYvLUQNCiHN8k7J3QMcDHcmyjK3IX/
	+yLNc5jcgQ7S1sFMiQ0LQryLM2grergyD5H8Y/4SOLJ+2DhqxiyXJguiy/+NbeQX9nAiaqJEq79
	yKSNJ2aUhb86pZK1GMpYGxG++3/nb8tRUHhPCtB58lcSD3GWEkbeF8Kg5sQCfnn2gpeAcKM+Tvv
	obDG4eFDaalvNiU5GCRR+LsH5XudxQvwkR0Xz8uLANqkbgVKdHQ8RC+6g3W3LEd2zT/ltczMRNb
	W5xi/gACaAdsUa3Umq3shWVJqMtDdoPIJHCqw==
X-Received: by 2002:a17:907:9994:b0:beb:bf23:ac78 with SMTP id a640c23a62f3a-bfe2aefcebcmr149500366b.44.1781274795114;
        Fri, 12 Jun 2026 07:33:15 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b32308sm110137366b.19.2026.06.12.07.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 16:33:13 +0200
Message-Id: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alexander Koskovich"
 <AKoskovich@pm.me>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt:
 Document WCN6755 Bluetooth
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>

Hi Luiz,

On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.

Could you please pick up this patch (or provide an Ack if you want Bjorn
to pick this up with the rest of the series).

Regards
Luca

>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++=
++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750=
-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.=
yaml
> index 8606a45ac9b9..79522409d709 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yam=
l
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yam=
l
> @@ -12,8 +12,14 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - qcom,wcn6750-bt
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,wcn6755-bt
> +          - const: qcom,wcn6750-bt
> +
> +      - enum:
> +          - qcom,wcn6750-bt
> =20
>    enable-gpios:
>      maxItems: 1

