Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF40F350D74
	for <phone-devel@vger.kernel.org>; Sun,  1 Mar 2026 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404827; cv=none; b=IOu2WgeLkk/KljTiQl7E5K43NGo/wehjkOKe8rQZJlPqi8e4Nt388jBPIT1Vgz+IDhs4HcGADVd+ttnyW80O/iZgcXLbiGvxeetjrses5Utkr8hkqWxr3O3qaQXFvEvt6Oqbrd0kN2fE5M5E0oMH4aM1N60nESuAAPFd0pO8CMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404827; c=relaxed/simple;
	bh=RoF4CYBqOCcTIp8+OeNsYC8UEsKn2n9wht7SnNtDGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3yvw9b8XN31RFEkYT94kTMS6BFLi6P78t4L/NxDwAeRPqmYMJKVdoKbIlgabtTyo9M/qelXZ58/q3q7Z5vwCeAdIFA9EOVBknWM+4m8vDcShdREsRoEshd81PH8+oAlesk+kdcMNXIvtuIB91Pk7Xs9UokdyRzqrFAbERhXNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmVl9CSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcfRFH21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmVl9CSH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcfRFH21"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621MRlJf2239479
	for <phone-devel@vger.kernel.org>; Sun, 1 Mar 2026 22:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=liHMhkUZwLObZQKcaR0dCOsp
	FbGoGsXIqL6LcZpPJfA=; b=FmVl9CSH3WuzakbWRWrtDYLnsJ1shhPHQUPlDcIe
	+9lv7bblF8fP0J2Pw0MmfcBT7vGoLQmrPCXiIyWaJu0Jpx38Gh8RfROnel/TuF4+
	FK8jVR4/TdHq9zqhye2kFv4nJoZqwxlJcfl5J8qRo40FtvI5l9KnemiwpioGxqWy
	2BKC+M5JSMqOQ8tsfh8ybY2Ho+JnCHu63zxiQh4uw/2OG1SYzfPgHMYDB2q3qeWx
	gGAk5611x3LjEVhtnZ1p8DG90CP30UrenFVjdemKCH2eU1rbTYOYVyRxM42JCdM5
	pOKXaUr+dFIY4po0vGSiOZXqlE3IeQ0GEjUxAoNgI3xOhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd3b2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 01 Mar 2026 22:40:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so2962773185a.2
        for <phone-devel@vger.kernel.org>; Sun, 01 Mar 2026 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772404823; x=1773009623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
        b=CcfRFH21mWxzdpaRfR3TO++Ob/4XgvqrAImJXhAnH3OLnF+QsearLgsFj0fN8kNXie
         YHyZa4s726kRibxG/C0XPG+K3h1NmegA5pXO/03G6iigQB2dDGVRk6qJn5gdElYmnByH
         7ALcm8YlQ66vF7P0tzCJLLngGfCnNhQstvCFsBzuoisUK6IUfSWSpp0iY8Xrw1avInOF
         RIUAOwibinClXgJdIrlc+aHGNk7J6yYq/o0uHdNfOK4cQjwES/sihif9bYnD+bbspAHu
         OINq3TmDqpJDXZYkA1hjEdxt3HfmZt9xhQx8wDMCHTLMdOjLCqf9RfkYbuYo7LoqH1SE
         B87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772404823; x=1773009623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
        b=DDLyTsjET6PfPU/PaYDDcut9O0ZwaG+u3vOANbU8dZCmC2/rKeiK/VU4vsayleydtV
         DpKeaYUwNZXX5t6lNqoViJn+udZ9G7F4A3Z05qh5qFsWu7B+n6rErHIAsndXRxZxG4L0
         3IFCSLYULF6hEVPpr0XwPEwHx0jQqup0sh2g3IxQQLBo75o8syEgoKdssPjLeGbh6+C6
         tqla1oQHFkboKIVvM/Rn8a8OsebY6Z+lkhAR79Nvfj1Ua26e/JeAQw9y2Hj7f5OWCFnx
         iM0OviRMS05PjypQE1EBIAK0etEmBSfQFp6c67npVSf7UINd/vu/J5HDafGW8lfexniF
         KRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWzYORj6CORvkXhQtrXEOK/YB7fiCG8nsg9fFS5+kneyizXm2yiFSDuzjGTn70RshEfzVMoNrEweY18Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhalvfmSjYKOXc9UvjrBU0JbN5vCe1dyUtYZySZLLl9J4YKhc8
	TaxhQQ6tQ8tYfro17X53dbpQccEVGeC05yBHKqNkMweJEwtqjMF/aC2LF46jgCvFncJfVOUvaG/
	X3P7YcpYrIdRzwnbxPASGz/vn5YY/3WFLXpy3jk3lK3VZz9TDwnCF7ay3/i/wE4VD2w==
X-Gm-Gg: ATEYQzxyPDiBG1kuKlxL9n93Ok8/G0FTKQRZbGQZNn+U7F9CgVvtLC9TZbinDLIWvbs
	xHqC5KykCjWNT/1iOTYoV64yOLnagkJb8oy5WkXF8QfxzQr5CSmldaUUHek5tjNn6VqwWyE7Hhs
	ts+4HCJzVzXsRYA8RIbCoNS+LUrQUAZzBQwRYnk+wVHOE1xa2iYyzOIc+BhftAfUXoyikMe6yZl
	m7hbz7Qfbx9TlFpnZkhPJedSZk5piYX4U9zWR5NtIIXKfnETi93AEhpgzatLxjrS6qsuUidGB/D
	zTzSJLy17O/PKDWXP6vh8TMIbaXIgoB2XEnS7ZnqjdWiENKLEw1UzCOy5jEazoO+vrlAm1Iyb+7
	3qMyCGPsh+0IDG2IgxNY0fZbrcqrOrsst4xjqtQW2Wctafb1AkbRnWPZTc65555CKSdLsM8cNoX
	y/6juKHiMg0RLMoMk9G6wUE4/6c7Ti5YeKhSU=
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cbc8d83cc4mr1468462985a.18.1772404823115;
        Sun, 01 Mar 2026 14:40:23 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cbc8d83cc4mr1468460285a.18.1772404822548;
        Sun, 01 Mar 2026 14:40:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016bf6sm24553701fa.32.2026.03.01.14.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:40:21 -0800 (PST)
Date: Mon, 2 Mar 2026 00:40:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
Message-ID: <qibmsgfttxo6kiaqyjljj6otamqp7okfr4abwpmuo7daanl6qu@ka33zvoz7lte>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
X-Proofpoint-ORIG-GUID: p0RYOzuwUmtvXmBg03wNQVK9wE_jyXU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDIwOCBTYWx0ZWRfX8uvi7CPQKR+Y
 Iz9ol4Pm9zFMyW7loK6VAoRreqUsC47b94Rk7U+vE4X93HQRuxzv0ZPRncxTPGLFvcZWt3TfwoR
 Gv5UL7nqhLhU3PuKSnlBGxIPJfeQv+0MNh96fmXxS05kaGa6G++1ypTwdDz7LKU0V1evVku55YT
 B1BpwWq4qYW/Z9Ab9LCjm5mkafObhKTavDQHLr7bgCkLgG6E3PViHazRJxRWc0AVgGg7wcD/w2y
 Sx7zjmnGmdI+nQldC+CV1Em/AIKfluR9k2W/enJEeTxll6EcvR4cDoFcdGhMVy39d57qU6kPVWY
 HOBv0pgchNQFkHo9boAWXZw1tPHI86KrWlXldr+uHGtfFdgn9FbmByiyzY8DEMyYAUGgBTDHdkr
 Lubj4EMkYrv7HJtwRkBHjPxChPdCxeJiTDbaD9DZtzgmeN9KhcHegkqT34UMoQPyRQeoIdSKODI
 t5Yi7iKLyl5oKRM+1dg==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a4c057 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=tZRLSl_A3aL-_mRAmj8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: p0RYOzuwUmtvXmBg03wNQVK9wE_jyXU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010208

On Sun, Mar 01, 2026 at 06:51:22PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> index 64c4f24ea3dd0..329d89977bdbc 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> @@ -19,7 +19,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: st,stmfts
> +    enum:
> +      - st,stmfts
> +      - st,stmfts5
>  
>    reg:
>      maxItems: 1
> @@ -53,6 +55,19 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stmfts5
> +    then:
> +      properties:
> +        switch-gpio:
> +          description: Switch between SLPI and AP mode.

This doesn't sounds like the GPIO on the touchscreen, more like the
external schematic component. If it need sto be turned to one position,
it might be better to use GPIO hog for that.

> +
> +      required:
> +        - switch-gpio
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
