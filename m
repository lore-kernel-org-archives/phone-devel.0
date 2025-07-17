Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E32264CD
	for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752786406; cv=none; b=lmmkU8+SZqZhlSijli07Y/BFHSl7WPAHp+wkoLpPv7860cEIN6rEJ5f+sAi/cP0+6zHkgLmdYQYFabR1aGWiVNOm8u8sQIaejOOwcEHKlRfb+peHgLzsmMHYH4V28lb7nMR1Nrwb0tnudkG3oCqdYlaFuxYUc6nSlXwMksVw+60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752786406; c=relaxed/simple;
	bh=uhfsvd6ujR5IiuRkGHiGSpUgRbJAikw6tYn5QgEz+VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZPnVutYRFUUSYdY464zKSfX0MaahEpzWuGBUpsulYcACima/UDlKd4sx9w4A+mUaDlW1hcnk5C7LHJ5LsGJEkx9OrpPpzTaKmFKi6cSQq77I1swAxxq/7e8T2B7y1ZgcChumDgGhVMl2MgZ9YdADoLFsJFnnLovZJPl0QvNHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIMVvM1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIMVvM1b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJhHGE015664
	for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 21:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjye/euzJtJqLLETvGURwJ94G0Q37cEw/XWFQryemcE=; b=fIMVvM1bN1hE4eUK
	WGzlKQawrUeXo7QK+Ku6DfRkL9mijak+Krr7T78veaG/n+2cu3v93hVr3JsQ5ME3
	cXLeCvcFfBgaodGi5fGCWH6LSu6KmvUVMrvzmNI3+sn0hvy/6RF4XsxtvDzY51m+
	kjvLDcteG81VEZOwVTB5gkcp26i7buKXYdP3h4qqW9pDz67Wb1JaThOwzNAhVruR
	SWd7LGbo5HkjnpTs0FRDOSyuVu1fSs1L4OaHU6uz1gm1ABKhY0RyXq6ZTeKy/6Kz
	G3cl1nZNOWZ230vSSGE22EyN2fimf8eiLR1KADQOvSBbrwiZgqE/qaD2L5kdgJ5y
	04lUug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyv5pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 21:06:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e344f333beso16511085a.2
        for <phone-devel@vger.kernel.org>; Thu, 17 Jul 2025 14:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752786403; x=1753391203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjye/euzJtJqLLETvGURwJ94G0Q37cEw/XWFQryemcE=;
        b=HqzcJURRBaTJBv4LUVYLxkwvWN+u1B7u1Ki7IZqdrPnlU1A3C8NqE9OYmkX/fEPs4X
         5lE9Jl0pjOV+1Exv1sDnrAYmrS5171HPH4R+Zw4uWfp5b17hoBQMhe5RV+53rnEqsbto
         +vxQ4Xv9FSWlvz+d8t4wc055a3NnyDcc5k597dJwEx1YaWXcwaDMXbSEqfcgzidv8xr8
         z0YMSvV/j2FYpzzX+NIq3Xg2owyP95ROGNwUKSFNEUTyLRIG/bC/FYthuh8oUaECzgS/
         6Nv8Np5lFw6UTdUyScBx/LWc3RQdR7nc32XRIKwRUF5g3zv6z66DmEoMDzPbWTJLn/2w
         HMKA==
X-Forwarded-Encrypted: i=1; AJvYcCVn+bzEtnHoHmMSIpLsMDr2XIjPO2AMNdVtKATUEa8250BnDRypzpon+zWODwATGVypqevwb1wDaFUn4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jB9xVsv7ADVPIOPT8yenctQ08EvK2J/tn11Qiqh/x0366Fjf
	7cX+Ik8TOE4iPvsGbZtb/ucs5qeA4TPZLS3XSgOpEiCrEdeMGeXMlhtcgeKqXEuIf7dR1TdA+C7
	GA5dLPh+TJr8P9XGoR7Dd/00MnqA86maE5Y9+UlZMdyyZbX/sITu6H++N0PbLTdqx8A==
X-Gm-Gg: ASbGnctPu/HOKGtG4Me0QYZ/R6KFXgb9B3xZItmSOXvZCwEfnsw+uY3r7Hk5wZY5Car
	ZmW5oitBrHHJ6xcMNCJ9klSmx1b+MRxDLFIkTXFAasAYFmhBrywXHELxVlVDw0EeCYF/V8VWc2y
	kAwJAvz07iomTyJXXFe/Pd0kTu8MTHs/Sx7FiI+1ESQd7QFMkO/lmJ431G0KqjZwEskvHedbbqh
	KSAQb6us7/qkOpjlQumBZC4QabCkJmEJuEs2koqDtAS/SHcFdk2Sgv9/hB2ZJ/uwvHoVMZjkgcw
	9nzI+d77EI8Lhx8ExGEnvB2DbdLrNru6hJSnDEJWdYAMuGT0RX2pqy/Yv1ea8JMunkvBDLZbF/Y
	8YRQ3v1Cr+YXRGnzCr/ia
X-Received: by 2002:a05:620a:192a:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e342abd519mr451825085a.5.1752786402692;
        Thu, 17 Jul 2025 14:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuPa/yRCQICTQrA+jm+Q73xxpZUEJk2US/0cdFi63bdkyvw+FC7AgcXaKulKKmsTwOdsW8rg==
X-Received: by 2002:a05:620a:192a:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e342abd519mr451822985a.5.1752786402252;
        Thu, 17 Jul 2025 14:06:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826461esm1427290566b.100.2025.07.17.14.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:06:41 -0700 (PDT)
Message-ID: <653da558-9dff-442d-acc7-65a1c0f84494@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:06:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add PM7550 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
 <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WCFKIcnNT06mxp_FiQiq8-L3p6Xn4yn3
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687965e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NiBTYWx0ZWRfXzMxmqydkrqQo
 z1u7ByNNZ2LeZeWOJlGZoJq189CzWmV/8wf+em3uY5E8JVdjttMbyZg7/cF0RhuoCDxqHoQfjey
 sDdLi+X6dMnyyFBydk+XnvD+RWsRc6BR40NibYIYF2kPokz71RXbL6f4/vXIGU0d4Ij6wlVduhB
 1v2cyIrQVoNPFStXHy4Emi+WUMc8QxCW3cn36Ul3nfCSwuiWqvMvcbFLFnQAi0m/17Vft8QQdho
 F4EyJCN7Bst32OFGT3ULprMB/YG1RdNTLLn9oskAeuwbzYu/QfxsmegEVfK74Klxxl2D2R7WM5p
 w+OmnMtiIKxjkuVrPCkUs3zGXXii1ZLJDpjwalTNMCU2cuj7zVCfETE2f7lhPDaeX14FR3/+eUu
 TE264Oo5ZxfmqhBw6U2riiK7x5PNSR3m3UMVAQhKWUuppn6x8Uj9enkh1dmuflQelBFq/4ZN
X-Proofpoint-GUID: WCFKIcnNT06mxp_FiQiq8-L3p6Xn4yn3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=931
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170186

On 7/9/25 1:46 PM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with Milos SoC-based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
