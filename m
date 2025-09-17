Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9745C23507E
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117559; cv=none; b=LM/QX3cmfOk+WtCTe0sdz9kzLCH6nSK0ZDaZgEn+SehPqQh6HcghTea+fQoKIBVz0kkyhoLUm+YQqBhrKqXAePybifE/8PpSMOscJyExWpNiXx1XvfW8wVDAVS6Q23rXlhVE6dKFhLEkHl+qPHWei2n5t4MJMndnJyUAZW3lfZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117559; c=relaxed/simple;
	bh=lyGb1aFoYsF+raAKp8sU36n+AGvzU8VFUBNR24jkqzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT193913JRGXNrr+T7IzeZRwdyRk4c6vZf2XZyqkO53T03DCpoG81rnYTjZnkw8zu9lkLduokfZKI/1AtX18ip0fTctHDoLY/aheKLsJpciOcZ/x97I5k52VUnqsX1RKYIY+6je2zFIYJskaGFnMtmjJgfA4zMZGa7ftXIbJGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmusjpdG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmusjpdG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xb3V027242
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uiv/XsSJSXK2+dr1Alsnv4ajZiNrr6ESJ9d7QQbgOeM=; b=GmusjpdGWf2ntEuN
	yKa8qCfbKl/RpVTJVVX4qC7wlSFDnSXYYpAlMOT665oYDxcgHFCAPo94gap3cs1g
	HEHutbKCNyXeh1pr6wTzKJ8bmzbLh3hSfg5AJUCvVTBXkXt7ASZSeafScMixmaRX
	9U1Qtoy9rqDjd9IDQSbIKRCdKG5KcI90JyzbW7Ts0pgB2YM8pU65kFgNBPtaRY2/
	ffKZRIHvflq5j9I3YBjEmToNuL7gupmIjwaXZi9h+DROeu1pRr4Sv1x/f+nSFb9K
	Fro7xJP687mno1TBMVJ1brL7purdc2tffvT7isnM1RQsPA0SXnMZC9ObTg3PNDVN
	hIiRIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwjkth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:59:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b604c02383so24894941cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117554; x=1758722354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uiv/XsSJSXK2+dr1Alsnv4ajZiNrr6ESJ9d7QQbgOeM=;
        b=ihXR5TYllvikkSoeXhQ4vULvwNaTiP3InOY54P7zEGkIYlOJx3r+C/RE2/5M1XRRoP
         /gcqqIBRp+/RDrbW7D6B1px2NbDRazLSV83uQrqjOX6WytsJ+vMRxT4+B4otuAqSBdh6
         ak2t6DzMvfZMSD+TWZH/qlcn4rIMB59JL8CnaA+NaazVh5VxQE5vb2mc89e9f39qrWTX
         l0zyM9YZVtRP+nIFnDws1oe8rrVjHCeCGAy9bPYERWMJ2eMSIkxvZIP3ms+YS96Mp7x4
         De5j+HpFOUEDdcdQV+IGNt5yPRYXg0q2gsBY8hgd/6lpdvKnj1fH98IxwSaaQcF6C8ft
         xmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGw899hdwXXzYyc7NOLEiJfRkp7bBxj4NlNkidIlOkbnhnZmdi9sWh39NlI51JByg0MMNvG6HjhBd2hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz73Vp73oVERZdtPJpBNU4fhzC7Wu6WixwTCEqM8WcrV9duWcy
	OD6iJbYeNzmPaoCiRF/PQSkaGs4tH3ewkMEiNO7hHYkesuOuDO0EXPub5xZL7tUJYBTG/Mal3KB
	VOsOCM1foDPQzUXWZo4feuBsKwC0KK4z711fL7HQWjhnXIxFf4JPC9Dwg5s/1wxA1VQ==
X-Gm-Gg: ASbGncva6bRVUnrEOMsi6QiRc1etZ8UVy94HQcXpHsLGk0+M0QWXU9d+jNFYA5aa/UC
	Vlmfuw6WBaFQbJqijM4jD1UlmlOl6CchHgHzPT/nFHyANnZsVFA+ExYxuQdNYSA3wYkEjQmE7A7
	ue0xj16cp9FBM4ItrL1/haXdOvBrqlCZmIXT+gJjKzjvuWfj35FK1Z+6dpWQ5ByfYlLXPe/WEU4
	NjuJXvbB1esu9JLVJYax1/w6g3VIXq97Y/Fd6HTTL5auE7qYz3b2as7KEdkU5Q0OrTvLIGpU2tw
	ndpDDBt9K1ggfAzmn9W+ZC71eYvp4lmCYdzaofPG/PO9ikE0sGxLj1Wz2ANmHhnxJwTTjnMcG2Z
	mIc0BYLyXr5eJk1J8SSfo4Q==
X-Received: by 2002:a05:622a:10b:b0:4b7:a308:b5aa with SMTP id d75a77b69052e-4ba68901f95mr17459981cf.7.1758117554307;
        Wed, 17 Sep 2025 06:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXp9M/NfwdwYTCoRDI+XQGNkB750ohCjW9JwuICJtNf50OfYIZe+NpGOz7kkOSn2YvOjDsQ==
X-Received: by 2002:a05:622a:10b:b0:4b7:a308:b5aa with SMTP id d75a77b69052e-4ba68901f95mr17459721cf.7.1758117553734;
        Wed, 17 Sep 2025 06:59:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07dbf5dbf5sm1019452566b.79.2025.09.17.06.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:59:13 -0700 (PDT)
Message-ID: <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:59:10 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel
 dimensions
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyEh6TK9TxnUb
 IgyNrPcnE3j/5VHkcDixb8sz2fsym0qC5xMWaF8vDx2XMl1ZorIigZ7mL98J0+tcBHe73AIS9Zr
 nJHq1Vm6Ex2nW3ih9ihFTBAJz5YpTreZ3Ww2l49wAbPuyvbnJ8Espc3G5bG2XpI8CaJUucY0i/3
 x4w4VCPaEKImYjBoUNVQLeDkcRdYt5zmNQ4d5v0FMeT2w+hqOh0uBjDoNJ8Mkfq6sKw2Zo6HSHE
 XAqbNcrAh8SfFoY2AvEdcHd88FrsWjJfeD7x8EWeaTgCYuMtccmQJrtI6vGZNdycqyIKsH8OidX
 MQ+zYEfxyg9yJFwBwIQNuMbxV3oNJpF4R+b3SNoSg9mD64vI1zr1sPwFYKXeOUTzfQYmwbh8CZ7
 tjLeGJRD
X-Proofpoint-GUID: 1FuSvDtKe0qf9gWq9jvhg1i_XXWz2aqv
X-Authority-Analysis: v=2.4 cv=ROezH5i+ c=1 sm=1 tr=0 ts=68cabeb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=H5uZHoPd_HLTupC0YvAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: 1FuSvDtKe0qf9gWq9jvhg1i_XXWz2aqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> Add display dimensions for proper scaling
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index e84b45ed82fd13850ea7ec1f34ddac5b59fc1434..8c1692f86e6ceea7b718361965e78f95d39373bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -23,6 +23,13 @@ framebuffer@9d400000 {
>  			format = "a8r8g8b8";
>  			lab-supply = <&lab>;
>  			ibb-supply = <&ibb>;
> +
> +			panel = <&fb_panel>;
> +
> +			fb_panel: fb-panel {
> +				width-mm = <65>;
> +				height-mm = <140>;

It'd be nicer if you moved these properties to the actual panel
node (the DSI one) and referenced that one instead (I think that
should work)

Konrad
