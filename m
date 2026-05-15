Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C6477984
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842535; cv=none; b=CbjdNun6BPf1kCqKp1FSfNq3EWoCRc/D5ES2ary5wJdA9ylWNnsODOsXVoejC3QZVO/rLPItI3Rq+dIJjvQTck5Xr4/Yq2LiqJ9HmVG7YN/x0cAMFXZ3UXQNt/h4FJCDfd7CozpmeGl529DD3bG2T4deR8J6XTPHB6dPHxxfgtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842535; c=relaxed/simple;
	bh=/7oiJ2nGzu37EW0OozAn7fioRo5rnaTnUXq1bfx3uFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDgH4qWE3x2R2iGbXLS/VAM/pCLqhRQClg5NY84f7HLeDaVpz7ZVkjNjHKm70P1sYGq6fXypvXcYPj2P/pEBsqVTaq+76hD2+i1dOw0IyT1Ufk93rYMvcvtVkXGa4B2DQG/nSBs5yGwqUTaJzPhO+qc0ue9vKaFxxbHlnHl5Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDJzjE7P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmStTIWf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDJzjE7P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmStTIWf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAjAhT654886
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=; b=pDJzjE7PGOkOd6Uw
	pHXCf21d22OILA4f9bJZjdN26y8HpDgQzi/fZV2pjS3mdcibOqoBJzrsrClR2+DD
	ngnnxK7Q00qRd3AQjQnpwUFTykjO137LI1gVdGISkWzQKjoDcnwCFPw4BDifxDPi
	hX10YaoQpjoVoUkJKGG7T+YuwTyRwB0Ko0vBQxlwZ/HcdpAumrISuc+dqazRXN+h
	lJmVn6raDFgq9mNpjv9SAaChLPqCiBrRVMyJ0zMZi1qLTDeoMWyqbWXPUL3fUL5D
	Ud3MyRbmzA4+T1oc88iJtkB7H+kPkAAfqG4KjXs5cjrQtREJ4GzIKGHR6fvRCYLP
	5UyqAQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptyyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 10:55:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so746174e0c.2
        for <phone-devel@vger.kernel.org>; Fri, 15 May 2026 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842532; x=1779447332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=;
        b=UmStTIWfOhI4cWVlbIXLzUz1LKiT3fK8S5EQBRpqNCsglaeYnc4fkFaIbXbzgWCQpP
         lzaRr9CwenDgucK/QBlsdT50PbhwBmUunXuhstIV8CXAnqA3y/zgpn+2mlPbyfB+tF/P
         6NrgV0Zq3zEzGujetdPEG/LsJDrzQUurfd+ku+OdRb1P1fpqbQ2JA9WdxwkMN9uDbzTg
         AfDIFipRHbuXNmQLTLIsuBhn24AQzkeeReO+wE+QaUEe28KMNKeecPT91uWCgUMrtGi0
         oMIwp4e94zkcRIa8mMaUiEPnVzywXjWvSa7ReI5/MTXkxYSBBBRW4yet3pefcWC1bVRP
         c4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842532; x=1779447332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GYVEpuq/9FUnUo2IfmJMOgpmoymjr26FmgRRJitPSE=;
        b=ZTljL+l/8tQ1RSid/5r+KVXJv5aMH4dDeP7JamLPVGsbISA8iPixnrpmHUoKIUO518
         eMvEbWqvP2Y4+2N2KfZq3rA8Y+76Y4i22HLwQM4BoMe/F7mw9qfsKg3gC/2JiZ66yWad
         0u9D2hlLATP8+oicLa/XPo9o1fCuvHHSLa9ZaIwuFxL8sjo325DBH3+dMd9A/BoNMyOz
         hXx3uIE8ICWj1dgeiKhYx74wS40VyG/pF9RYUMx2v2DbN1k4F9VBORccoIKLeXr3/ury
         FdQe35VkOZ7/MHOfNChsQognacqctUG2jNvByb3fOYVFwM/TyiWOU30/rJDafWtyDqB8
         vucA==
X-Forwarded-Encrypted: i=1; AFNElJ913sWtQuKChX2ETV9y2HoWNs4eRQ1jz/B/F4uhjDGa1RLE1U91YjE1gHqv3W+JpAig8aMe8IVDQ7FV7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRfLzlX1KVgKyoqApJ9aBsVJXrvoXYIQrzK22ByrCeKl3NHaF4
	5EhG3Zzinoe5kRPFNzkU+tkQcGEc/YavvAStQVpO6omnUNwy99H0YOUKbRBccfFpnOokUcjp3D2
	aei1s9HoQgFspR+j+4kDcuNL0AICd2fTHB038JQyaZzUnlATb3yeh89Nki1PQG5NghA==
X-Gm-Gg: Acq92OHpMXio0HpvUTsJpulJTrLcx0Cjj1KSD1Cvq6+FYdxEPu3y8SfwMQN2hVBXY+o
	sF+sANIjnV1DfiTZp7b9KyZPDyLROcoKmTRZA4AAm3EQCyZW9WA5M1ZRVJGu6xQJUThoqydgq3z
	+EqiMTXVusbPhhX1p7cfxQK9lEqfrbOeLbrV5QVUY1UI7WQxeJ+XPlYHw6yb5JBXAzxMQYx0W3i
	QcVt94StdRSRFEpeWzmA4vv5/iyAUruep9wxCixuWeEhjj6ss760T30I9hPaS76303ej+YmO3c4
	95woD2hwSafNRSMguHy8M9PTqlGkgGcrN1vf+jGnolrdeODWRjimgUdg280PwCds+8zxRGI0tfR
	oWM6F6fTx2cUbKpEp1X4tDtK7TwLMWkbnRwOgyNjldQzjjizmdkPuT36/i8eP/2bCiOfcN/Ncfz
	FOhVI=
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr592157e0c.1.1778842532221;
        Fri, 15 May 2026 03:55:32 -0700 (PDT)
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr592149e0c.1.1778842531734;
        Fri, 15 May 2026 03:55:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e60a76sm206187666b.53.2026.05.15.03.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:55:31 -0700 (PDT)
Message-ID: <ea0c60b3-df79-48fc-b9c6-d749cdce2c05@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:55:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW
 path
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Robert Eckelmann <longnoserob@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-beryllium-ipa-fix-v1-1-816326ba9047@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sn_lxw1OPCJ4YHJJx0iaY7VfaAPYB16H
X-Proofpoint-ORIG-GUID: sn_lxw1OPCJ4YHJJx0iaY7VfaAPYB16H
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06fba5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=ab5invG6YRD6NB1u6q4A:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=hhpmQAJR8DioWGSBphRh:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX568w0zae8N/O
 vHyibKxPKxn+FK9g5Ulr0HjJyLsOCX2+3//tPIrM5xzqoLWDJo9sgGkzr+MEEWmvOxCyppjPeYy
 9jIjKu604uaCIwUAmoZpX2ECoxZjsZD6cnrMBOylBn4p8dxWQzPadPTMXBasEj7wjWWXeM+CWWX
 RVnWiTV1g0QH4EUcUgaRm5l0kHl4YyfFUim+47gFQoko8bKeuBR06GyPeihAFT4PMvorsqheA4F
 zhKxJ14gZoUXv57okAp+JSmhFYJtCVGXb50typkz8Vg6zas1zvdy6wCBeTnqlT+3PqyL9sVs7Xb
 nygQKNU5nDn6497qyl4VrBH2fcNfY2pZxXohK4wUoNraheKyvP/9jpTK2d0MGmtuERa2mTqw+rI
 bOpxnYR2+x3OmOnuNrvc6/eKmf8ZWjJsApH/UIkAf+iOaFIJmiy37OBT2X4xgzalg2+JtX5t3me
 1LbOac43ZIYlqkk5Ncg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

On 4/29/26 3:16 PM, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> The path was accidentally reverted back to old while refactoring of the
> device-tree.
> 
> Fixes: 5bde31dc7b17 ("arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort")
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
