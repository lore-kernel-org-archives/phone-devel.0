Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE032E6A8
	for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766060763; cv=none; b=NW/Uje2GJcCYd1hFQnwT6zenFnvVcI7uH9QPuKWh7qWEpoWNOXhbjiqsJw5tI/5URCl1JDDiuAPxS/RcpqJ5zX8nXK8MtA9kwwGRew7HlYLuItIfWUQ6fqTAVDRt+lvJP5p08e9KVm9ehTNjy1F4Vk+/lmznHu7x4Anggxv3+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766060763; c=relaxed/simple;
	bh=pKmU0fwG5vsNUByzsdzUiSnAznD5hFkczWB8RpIVjnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Osqbnm4vNqII9F4bDanlEK0vZKhvXowIITzcRXgTbEz+3Kq9BffZ0iyQTEyRSoRHNB9F65kFpbcz8Mk3MFhVg+xHih4tx35z1MGuwwcs9Uq/3TV/3WaNXsQKs3/RUYyzgfm9uhagi1/NNC80xr5FV7EP6xrAY7WkQrNsJDMojEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGKf7Hix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WE10zUkP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGKf7Hix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WE10zUkP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI92Igc4058331
	for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1kei3VviQUzx7YE5/174xV34BfK+CaqS8GVwkzgtt0=; b=eGKf7HixctNSAkSt
	UMWag1Py5IDuQYaD9Mvf9vZLBrscJoS0uzT7FdibRHY+sZc93cz7uWKYg93u+FBt
	7Do+u3N9DqYTpi3s+Yz6CUWdpas7m46YzPT/ppXtqkqa4JTx2YtcpOz4hghhJRdP
	n3q7MUWv8xLBVyFZCvfGdrT9G2Sg4DuiPImGgZ50soY0SOS9+/fjecvKPrDrAYjm
	akEZucxJxdkcrrBUptZYcr8nYjaR5jjyHdVANjW40lmXa4OHkW7ev7ibuFohSOPF
	jPro6m49qpoXb8FGVV0qsslnAomxYRW2V65jvTTGW1pMRAiuNvE96snxC4NaA/Zr
	ODVWmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5bj7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 12:26:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34b9ab702so1160231cf.3
        for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 04:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766060760; x=1766665560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1kei3VviQUzx7YE5/174xV34BfK+CaqS8GVwkzgtt0=;
        b=WE10zUkPuS4T92xRxfHdsilyMJTdJQge0zHvPWu1evOLgUCBgTaT+hNyjjdf1wY08P
         eSp/mjeCMXsqn3xt0ezOSMK/Po9sixXHZjsPdnX8GQ+K022JWxp1ZcnhF68W4mi2cl2s
         kdZiL/PRAYRmOqL17s0DpCY/USsS04ka7YALQnG+i4VY7D9qNbl4RcT4NCdUetnj1n4m
         NQIP80sN6AnGMuawHUJVxlI6mZEr/5OeI54NXkSPrFkkfDspjVu3ftx7KQIAO3FEFqUx
         j/UJOAjcbNq7pKVnJYLf1M07SSomiDr/7KAsJT4nCPmSpHowczuU1wDPoqelifsUsGOS
         SZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766060760; x=1766665560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1kei3VviQUzx7YE5/174xV34BfK+CaqS8GVwkzgtt0=;
        b=Nn070L99OzRboEEz5zBvTaTFEdfD1KUV5KnnxrofphVEZuGOIywf8gqI7sYuIk8qjM
         iPWmbhdHZaGRzoNtXaHu8Gr166LrBObf/2ZjElGhlNz7lTo6mBRAz+ssFgqv0eiB4O0T
         lPyanbbqMd3Wtp6bQeUFG0oHSQiyURO6ZAW7EyxNZcnKG8mRZP+6H+wMe54rvvNFxIgP
         HfN4ygRRgjiWPE4VgKJm7oY/9J4vUUiPVCbBaRuoSXlF5kJRPx6WK6F21Dru+o8pgxy4
         xgOwwFJB3BLH3e0DCgI53Kr2QJYd5Oa93YfB4kGdGDNmii7BlNnnCzMbh+51jpDRjlKE
         OhAg==
X-Forwarded-Encrypted: i=1; AJvYcCU4i+EYZEhhEBrbgVi3UBj88VaFGKbFJIjwYcQ45+nVTSvL0Nh6qUDj/q3k6XCdw1BY+Icbc5swQkjpGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiahdLCd1sqrQs9agVVcib0GNafCupmVMfu96ZMxDdmy2juB03
	WL1W9nLZRu3xAduQuxI3a+lbSHzepmk3CeZT3f++JzpsByCJP2zzNu2xI1mm5rhbLlCcMyPCNL7
	g66J7tnTzGRTauXOKA47fzqPkd07YFqJ/vadzN/xeBcIgbtbqZUJaYkH4O69UvZMIYg==
X-Gm-Gg: AY/fxX5ba7b7BCcCvFGXVNWNA+dHLUydS0DJwu4MwQTUTPgzqmQP2/OBxyVIELzvkpB
	pn2ezhw/U2PlC6CTI9lJQTTlr8A9Ms8O2sT5C3hg1JfOluqPpvFZHyuwKJgIWu5bpTBzl3kxWOH
	1nPAHgV7Jia9RS80TvF1t/W8Mj1v/EYF6AnUrkVn1jwoYHbOZo+WHF8GFwWCjnPZ7mkv7lKq6qY
	p5BFTELA+m1oJ87szveL/X/bCZNVqthfZuhVXzlDhJwFNyVq6hHvjWXk2fg3nnlspdC/hKrWTxo
	OUKehjM1AVTYjajUIecqca1BPuvLJVv4VW8XhGk+cdP31TsKyB7+wBXRR3IOGIRoVe/59zvi0xQ
	HncGgTHwlQC16wbUfTYMOFyWnvgefFjUGIABlfawzgJnzMeqcslWdE/FfDwiSUptzIA==
X-Received: by 2002:a05:622a:834d:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4f36108e8efmr15386781cf.2.1766060760466;
        Thu, 18 Dec 2025 04:26:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGxOsD6vYrUp/zDUbJN3vsyK2mh6VD2QunVUUWpY5pcH2SGoXhlbu5E2ZPMIl+YBcRjc1A0A==
X-Received: by 2002:a05:622a:834d:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4f36108e8efmr15386441cf.2.1766060759889;
        Thu, 18 Dec 2025 04:25:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b588b0b3asm2410527a12.35.2025.12.18.04.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:25:59 -0800 (PST)
Message-ID: <f86b483d-c674-4901-b2c8-19a535df4234@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:25:56 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-db845c: Use pad fn
 instead of defining own
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
 <20251217-sdm845-mclk-v2-2-7028c2d09145@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217-sdm845-mclk-v2-2-7028c2d09145@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LrhGxnP1dtiklvxfqftmH70hGQclUWTS
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943f2d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e_nn8CCX7OWYOPDVI2QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwMyBTYWx0ZWRfX/Njs6cJUmjVW
 VN9vvWuuAf5ByZgyi/KJIEMKjP57Oigbae4DIezdSkKBU/M+PjlOFPTBWOvHPIxQbHABNIiwJva
 uZWOIQtNXB3r6F3XitDmbAH6HdnPzbGW1sP8jVXM+e9GwiCgZU0KqjtOYzUYCVV3gHXc3iETa5D
 UsvLWQjtoKvCBAaGQLSTbElHNjx/P5eg0GCjPiTjmf4zTeOP949zUEF8JJS+eHH8MHPdDmzyS8O
 LfQd8ZjR3DBuBQDIKOUUX1C3jfJbr2suLYj9zS4zHi5KSvxikYNyY7Pa30M4IR/lw+8D6y9E8D3
 OeQiyyCRDAqM1gzXVxj/1+CCysiMdNbVhiQEafAx7DtsIEXRUVrjd/qyPaNE4sdRlTf1KLZd1eA
 AxBpwKGxEt7+myMWog6URG6wp1w6bg==
X-Proofpoint-ORIG-GUID: LrhGxnP1dtiklvxfqftmH70hGQclUWTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180103

On 12/17/25 12:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of defining own pad function for master clock, pick one offered
> by sdm845 device-tree include.

I'm a little bitter about the wording - the pad function here is "cam_mclk",
whereas what you're doing is inheriting a common pinmux/pincfg node that
refers to that function

[...]

> -		mclk0-pins {
> -			pins = "gpio13";
> -			function = "cam_mclk";
> -
> -			drive-strength = <16>;

This patch changes the drive-strength (16 -> 2 mA)

FWIW it's 2 on reference designs and Sony boards, check your
downstream kernel

Konrad
