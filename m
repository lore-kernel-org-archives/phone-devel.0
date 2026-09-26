Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659A34349B6
	for <phone-devel@vger.kernel.org>; Sat, 26 Sep 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429697; cv=none; b=eioJocNr8OUfj4rg7F+qm8vlNA0P3R+NR9H3PNFS/2w7EC6ttw2rLi4mvf+9SoiUVzGqvrDZ43+Zqz3yQTxPzCTvFbvaKjummkoJ1xMqoEMZJ4UQ9zJUGuYHY1klBIq6f/cxCQ8eQldw6Z5KCLq+YLgQmVeUMIN/cG9nrl/ahQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429697; c=relaxed/simple;
	bh=3CWJLlofZQApttlhq+kpMHCeVeEF0wllP78y3q08F/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL6aQUqUgp6a2Y7Mx0tT9r23L36eVBtHOADdaSOPZBSGzIxFKmaKaTuma+ad31y1o5JHqcAN7ZUbokRJ5go9RyeNIL0ABgLi5rNuQotHpTl5vfSKlb1jOOE5bytyNFDG7MXBmzfOuON1ppRpHx1wQwHZe1OLj+UEL9ldjcJIb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5gT76e8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5gT76e8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so9324115e9.3
        for <phone-devel@vger.kernel.org>; Sat, 26 Sep 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790429693; x=1791034493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfnxRYVPxR6v6awtj9prtQ+scY/SGqS6pi8ulBW0ptg=;
        b=R5gT76e8ka3FKKJgaJPAaXmpOBM67BCN4ULBx7zq1oJqtGgnARua0vbh9cM1gJ6oiX
         9irFqkkkh87vKqS0k1c4sQnWlyp/5cpEQ6LcOPbdcIxANIrxEObYH3siJsbFj2NK/wbW
         y0ZzH/Xku9oT4lGkyJ3tQThbf5r/B/P4Hu0mCowv2NMLkiISlzRF/pANPqZT5ssW74p7
         j1gkpJokbefo2TKRJNKzd2SepF2l8Gfpw9+iJpGuiUohj9uNQshq32ImooazTLcO11Xf
         F9Anub4N1w0PDn/IVmzvV+6iMzSXlM8AOTZppHZD69LoyfegXiJnLFA92TznHAwzui0l
         sDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429693; x=1791034493;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfnxRYVPxR6v6awtj9prtQ+scY/SGqS6pi8ulBW0ptg=;
        b=KZUxh9eSQyz8hAy8fUTr5SMscGBvJVcXDfd+qbWWxMbZUC3shNl20xqZTPZHwmiGFP
         2gkbcRoC0RbjYhv2n7V26mE09uBCfLyzUOBouLveOyuNzlV8qGCK1gZx0FLTgwouNywK
         sBEDNeyt+D4zoTQkdfb0HlFZdf3hVj63UjNMfhAO8vuaPXugXL+jMoD5DduN0aYBLS7w
         P0bRemwGqmfy7Tn8Dspm6dyl9rw5NqvgolKks2zZiR5LLwuGe04EqogVHb9ydA3RdBm3
         nTKZ8QbIXRfHZvO2IegHMPNsAaJFK6e2sHU1qGhUpuzvdNPJtBa8xA+n1SWYRwDgyZ4A
         57FQ==
X-Forwarded-Encrypted: i=1; AKwUvBx989yeUDCYkpXp0oiQGQsdLOKq8K1r1j8tQLhKkLbhGJc0WukpCvb6o7kqG2P+FvSIv+v49IguK/gPMg==@vger.kernel.org
X-Gm-Message-State: AFuF++lY28jpUZKX0H0YLhpnYwbROGt27PwA//c4yfBmnsGcDbdBKJ4v
	eDX67SgjqoT/1PfhbbyUR2Ib0uQFpkwXuMQq9aiyjv9w6UK1+2EIfUKl+W3QRKgtp9c=
X-Gm-Gg: AYBFou0GLnkbbhx2OiPrYLZprP93mieMajKCkoAxgCyrk3DrUkFK8WpRFpez4Ev+nrx
	c6WqQQ0RW1bjvKi1V9SBiqN7uOzMQMgFrI7KpOS5LC9k0HfbpxcQTLoUVUQZeshjbPht1jmqXdM
	+FECgvja7B96l5kfLSs882nNVeAw6Jdv4zr5uudK3UclFVbLh06eFXGcDxWcSBQYZht2vKoq4P9
	16QTBuBOTN6D8fKFAoi3UPLtLARtGFUyte4T3xZVbjRvpfSMKl4YAFchoyzxaJzaFzYGPIeuRtS
	R0V1alWivDQlIETp1tduqQUHnlQ9iqiKOlLrudlFgVrUJn987RQtGBgRjibgv99zt29OrXxTkGI
	uHhaYuVKmxdwxS0WtDzve0+an2AxUHU9ergBvjkqy7VxjQJtjXw2LSGkc2ru0HgmHrIdgmCbNYW
	ArdBw9MdgjXbXJDITjN4dUvoCrpnvCHzL/68e3jwYxQRBNoyhGKBNBN9Z6T/41iejQCmeYXBlyZ
	nrg4PecLoE=
X-Received: by 2002:a05:600c:3b0f:b0:49e:7cc2:e6c2 with SMTP id 5b1f17b1804b1-49ff06ed8a4mr87510495e9.27.1790429692711;
        Sat, 26 Sep 2026 06:34:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a744fb5sm12791808f8f.33.2026.09.26.06.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:34:52 -0700 (PDT)
Message-ID: <f9e0f1d3-efb3-4c56-8c1c-9a608097c2a3@linaro.org>
Date: Sat, 26 Sep 2026 14:34:49 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/12] dt-bindings: usb: qcom,pmic-typec: Update
 example with vbus-supply
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vdd-vbus-supply is deprecated, thus don't suggest deprecated usage in
> example.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index ba790c4488b76..2c8b11e92fb28 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -163,29 +163,30 @@ examples:
>                                 "sig-rx",
>                                 "msg-tx",
>                                 "msg-rx",
>                                 "msg-tx-failed",
>                                 "msg-tx-discarded",
>                                 "msg-rx-discarded",
>                                 "fr-swap";
>   
> -            vdd-vbus-supply = <&pm8150b_vbus>;
>               vdd-pdphy-supply = <&vreg_l2a_3p1>;
>   
>               connector {
>                   compatible = "usb-c-connector";
>   
>                   power-role = "source";
>                   data-role = "dual";
>                   self-powered;
>   
>                   source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>                                  PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>   
> +                vbus-supply = <&pm8150b_vbus>;
> +
>                   ports {
>                       #address-cells = <1>;
>                       #size-cells = <0>;
>   
>                       port@0 {
>                           reg = <0>;
>                           pmic_typec_hs_in: endpoint {
>                               remote-endpoint = <&usb_hs_out>;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
