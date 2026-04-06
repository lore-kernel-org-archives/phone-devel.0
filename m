Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0FB18B0A
	for <phone-devel@vger.kernel.org>; Mon,  6 Apr 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490703; cv=none; b=RPznRGlEStzlkbvKqgWDwIY8GLu4AZ7MAbcapLArAvTr0PXFJYpBdD0r66j2oCieJIlARmi40uSnBwQ1xDh+8Op+X7plKR2RAYNoZSDBwNAHZOdvwvDxBGF8q7MhfacOIwYXtmhUkJ+yCNxwkSFhZob2hRqGCVZYiyHqDrCBlSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490703; c=relaxed/simple;
	bh=rzKk5WejB+mbn/yRTIRbxkZzr1bQ4VA/zMee/GV8yyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxGq8MoYSyeYYUDN1w7MiW7GnBdFtOc14lEuXDRa8UFZVauvLouiphSDu/jdBgwKJBgMjtaCMIzxxBtZ+TGEHSMYgLtSogmmhULOvwTfEdJt0f7a0jIshv3sOa9itcnir8QZiD2FI7MFwi+uwI1GE0u7luCgzOs/4arAELp5rfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J93kyziE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIf10krA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J93kyziE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIf10krA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636EvqFs1718806
	for <phone-devel@vger.kernel.org>; Mon, 6 Apr 2026 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=; b=J93kyziEVXCaDbwt
	ZIT0AYP/Y0+O2Lgk/IKQ0H3W06K6bAYtGRhFzD/XVbuvpZuwpBH6MUqdtNwsDJme
	WouloICu0BfgqnKRoKxAXUdFscYsqt+EzzQAr3mUlPGKWa9Z7g5Vs2bE84XzaaCw
	SOrQzYu5omCBrrW6wKKaa972ZNQllDgt2bpVHBel4Z4m43XHQAmU1EoqibHgajAY
	Q4M2Q6kP21cghTLNdd/R8AVtvijc50TVOf5nh9YowLnhNFLjo8+T2wUK3iYDNgxX
	DGMmbGzJS2N7idyKVqmsQuuOeeXQB216jedwhbFbXct2QhlY5R1P0fM7Sh28eK91
	GYrzjg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcf2ar5yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Apr 2026 15:51:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127133794b6so6486420c88.1
        for <phone-devel@vger.kernel.org>; Mon, 06 Apr 2026 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775490701; x=1776095501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=;
        b=UIf10krAU8KYRdzXDO9Ri4GIGW6fMdxfDZCsZ+KKjtLLmYaPC7ECdBBNQb95xslbin
         srJOTvlDCLsi5pxjORQRPowlO+X3CJ5qA0IJEQvCFtMMURoRDatURrGD+8unpUkbUfk/
         TxBEce5QVHD21Vi1VTLnp3pFzGGr6n/u2WlRO7sjjdyBvCA6GyQ+G/tXJcHm8oaXnYVJ
         uf540c5+kwH6UlDOBT1xXq71Scyl7JZCZuB2w9eRlgySls5U5hOi6x3VjRLuYn0klynh
         LAcyB5GaRMwaSfBsJUKcaY9JyIIBx/bJzqujFBPsinLl0UAJQZtSNpGvriA3M/OeL/o/
         M8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490701; x=1776095501;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukQ6Zlht3NZUUsrPWZJsHdIlUjCDU/cg8ksvGrwiy2Q=;
        b=S0VeCHtY96iXhdQulXrdLR1qjsOid5ZeE68wcAS+QhSoSBO7xPwfkoXFdc+sazHdm1
         XH6hQ1+Or+AXdH4H/Uj3+t9OhB9gpNTo859Y64vHsoBmF7CGP5kK+GmC8F46s7M+D4Hq
         GgY1S0HdmvJBpP/880DgnJrrjtjmDFJkpwhg31Tj+uu4SzTihRMcXciSr/Y6XBJYDjkE
         JXjetey25HoSgdpGijhq9MyzzuBnJyHskPQIWjF4xED3oanYdx/VA/xZdjbPXThL/uml
         cLH/FTHyy6SW0hdZE4Cht22iRecHgclLd196CxoaSI5XAdZGUGOKQGGQ5G69TISogHcU
         3w6g==
X-Forwarded-Encrypted: i=1; AJvYcCX+X/PEH8KLLJWGsxCWPCPCtm9ITOFg0MaRbUpJCEEWqYrFLxzgZLyLb045yAtNy5m6oD08jy/hm0xZIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpP7Vgk9x6MCbqyknvdvrFGqaXrPsKHXGEO250JRhiTvkcwzR
	4hvbefVMUxuDiAtoy7wDhmoEWovKQpiBxvAhDSVZF9etHKTgKmBSbz0cn5BJ03B5rAtZvowLp2f
	+huJa7YbBLt8iBL/sKzEfgI08usYFWQK8bsvPrL6kB9J7VzoVa11mHoJGpD1guqw+rg==
X-Gm-Gg: AeBDiet3KF4rr0gQJYrlSV1OaniyiLCAfRadiUzxdEKztv/grH+5eD1r4yd5lixfpRG
	Cnp4S5IL5gq73E4gXC7QoCyLfDaF/NU2JsCyxmvNRSHls+oWtGYJILoRnXUobJTRh1FAgPy6JWP
	A+D4TAdxqCs68x8d6tWTjkLVcvugZ/wG6vSilweGYjjg3v5S+XBOaIorUYybTULWTNxHTpypLp4
	F2Qzw26xetMMnv6tteA4zDDlioqJI7aW419lSCjk6/5SOcA9sDrERFQvO8puorxNN96nd2O6Qwk
	0QRxmNxGMI+oD+WusVoww7pyFI5QskvMMoZN0p69cC0c37N83SS4EjxvXbTGZSLufFyiJaFB2bp
	jD9Xxn9KeF/kwvjKkyxHYSYU3TzxVeg8Xk0Z6LES8lX4tHFVotw7OU6lD35rvbX1azuoyYBlwAb
	WGp5G0L2p8RazBOQ==
X-Received: by 2002:a05:7022:62aa:b0:128:cc34:35fc with SMTP id a92af1059eb24-12bfb70ef65mr5780051c88.16.1775490700209;
        Mon, 06 Apr 2026 08:51:40 -0700 (PDT)
X-Received: by 2002:a05:7022:62aa:b0:128:cc34:35fc with SMTP id a92af1059eb24-12bfb70ef65mr5780019c88.16.1775490699506;
        Mon, 06 Apr 2026 08:51:39 -0700 (PDT)
Received: from [192.168.1.44] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm15701803c88.10.2026.04.06.08.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 08:51:38 -0700 (PDT)
Message-ID: <0cf5e285-b5f0-49ef-97ae-6c04504044ac@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 08:51:37 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: wireless: ath10k: Add quirk to skip
 host cap QMI requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-1-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 34_wyomacFM75iOug7ctesJmzGNsiybU
X-Authority-Analysis: v=2.4 cv=A5Nh/qWG c=1 sm=1 tr=0 ts=69d3d68d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=KKAkSRfTAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE1NiBTYWx0ZWRfX4mmkLvpmDGjv
 0GDJ3DhTjLRiCw4mc6L35QXOdTS504RRM74/qZsxB1R8l7Io8lkKdjH95fjWuz7N5v6GMlEqpzc
 6jt8WW6UAY3crD7TpbeyWRTPUEoZCxZzLK6HvvIE2yWCbpQHm9PUf1bbs2gXpyDyTAox+qSe+mi
 LMQKflE8ozxL5zP8k3VrtsbZCmez3xVd+rP3fg6W976Hms7OognsVXNujoA97dZNSMdAQhOL3EA
 xDOu4OzjhjnVIzcKd/DrZlYpP+CkgOH1DWEdlH0d5RUwLgJxcrnHsFyH7OUjr5HIBdounU0Nv5Q
 zjGxI68Zio8Bh5eDGk4C70MaI2nXy0NyBufUN4RAMfjIMI1Ho0bkMOXIhT8PEESTnb2NAGKekhh
 q/rI/JQLOwqAQCouV/xaY6czZnF55YP539rJe7+/HNG3k17jCirLexHldZs/nhGKWLAISCdYfcn
 VRU9uKARq5guQH2Ozew==
X-Proofpoint-ORIG-GUID: 34_wyomacFM75iOug7ctesJmzGNsiybU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060156

On 3/25/2026 10:57 AM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host-capability QMI request.
> Since this request occurs before firmware and board files are loaded,
> the quirk cannot be expressed in the firmware itself and must be described
> in the device tree.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index f2440d39b7ebc..5120b3589ab57 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -171,6 +171,12 @@ properties:
>        Quirk specifying that the firmware expects the 8bit version
>        of the host capability QMI request
>  
> +  qcom,snoc-host-cap-skip-quirk:
> +    type: boolean
> +    description:
> +      Quirk specifying that the firmware wants to skip the host
> +      capability QMI request
> +
>    qcom,xo-cal-data:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> 

DT folks, there is a pending DTS series [1] that would like to reference this
capability. Would like to get an ack so I can get this in the upcoming merge
window.

Thanks,
/jeff

[1] https://lore.kernel.org/all/20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org/
