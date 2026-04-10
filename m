Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFBC398913
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827974; cv=none; b=rCxx8fDAqzPOYqnhXmpguV1FXQgZqzYTozA1Aatje5dvibKGfitNUzOoxJMYH82ZNNZ9cNMASeQoFXB6vqzrj0ymWMxWf1OaLHxOXEmJnLtSfBDfkYHGCwHv4/siAfswjDdVjVzQGwNbNTboT4vBW2qJtoXzbgC2yoRH6am1dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827974; c=relaxed/simple;
	bh=p/F/ubJz4TnePeuUAPFWFIpOn4leIoXpjB86p8c9qi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNPcrMMnC4kckyb0muPlmaTWkzv7nVDpQtMDH476Q1Tkq5I/cqQ9E1OoPUOPppnFqg22g9M4suViSuK+jQWGj+Tt09Iur8arpPP2ZpTGMWu5W17NOOheeJn6T2FFw9GvUWI8Q7O/3wucne6rNCpze5VSyg0963PvdOn+ZyxjSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJN23wLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyFg6G3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJN23wLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyFg6G3j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAp7JG3742904
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 13:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=; b=HJN23wLN1XvP10pn
	pzb0hFcTObTIZ/4vpTdykvyWGv+DVyboLJX6PEcfO0wTtt5BS/6d8oZhDIbOhMXO
	6xnEcsxskeJi0v30MPAquDTxLZnwPNdZwhB7lD4JStYTge55vcgeq4wGFTeCUc9I
	4IWp4uJWRguw+0Qq8U6l2oN+KSw3AsfDX3yaNl3gqTOdF07fx9kzIg28TaOXodo+
	AMRI2wLovsG1qV0oGFAY7hAadSRYMlZAUSUczglHoH3a1dPLo4PVFFm5wqbrDRX1
	7+yBbVJkotFqxlNFGdnMGAzsBmnjz/i4JnmipnqAko/FFfLoDXHF5tedzTzsedp+
	ZWvr+A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytngece-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 13:32:52 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6838006a075so327834eaf.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775827972; x=1776432772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=;
        b=CyFg6G3jjLkFSyxKzTqcuCrokea8WKm/sLpYFd/2IXmUhMKtBfmWhZ2HBPzW0kOMRE
         CygePEejEaFE1AOpv2j1p1ppfDnfv1mqu+ukK7G8awl3LP0bLL48o4Ckt30Q0RZgFcAc
         e890YtyuJIlU4VHPJHG6uHwBvMoEyX40a/eKxYriFQu5QHtKXkVqXG3OfjY6gwi7vD3y
         RHrBCMS1q+Xxk04KwUVMBm6bfzucAI9VMTbXT5I/9ls5caVhl6dTLo4MjYNe77/F9R10
         EREOcXpZcGroJ7DKujnRm17P2dJyLHKtiMywThf1WnK8YM+xsy+OX0CoJdjQXvIJqOTQ
         XvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775827972; x=1776432772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=;
        b=B9zGMo9xoLioSFu7AGLyLgKYz0yhGxlBaNnJktDeqbVsBLdG8xHE2/9pd6BWUQZEMK
         sVTrHGM7f4N+5OhtU6W2Nq5TNIu4uKIAQCdyCTO9Mjldk8pQvQhJCO6P9BEjxlAi64qu
         Av7ZDtp73/56Ok/MBDX91Rn4nRCcYgdzJ4tQe4715Q94zr/wUwUClIfNHJ3xl4jta7Ro
         Jm/Nga9EqvbXCq15dquHIAgz9LdtDtP3u2E/xBUEQ/33cPoiTILaZ6CC8IbZQI5nZz5p
         6xcx+082GAyVXimeKYX3D76x6I0Fk1ivROZNJjYmXP+BVYVlP9E+7/KceGdLD/VlXSYB
         99sA==
X-Forwarded-Encrypted: i=1; AJvYcCWk/MsyqG/WRZczu1PgwpKVaWbDdpRymNW6YMUcZ+EpvyeDVCvImquwW325ORcI9R6dOaoo5bP4puL74A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywck4S6iSOw0ojYxrX/mk1KY0kj3qewxXybspVWhBJAimvHPzEg
	6BdiCkzMiZGGjomRSOZ7tyg9aP7PFkZoQ0GISCKTg0acqgxeYfxU6UQVLJT9XlSkW842t3GZ6fk
	YWb9RGnrOehOpQTTScCgk1iP3Oq3z7aDsC9MscEtGUJEeqSFXYcTcrsEoFMvyFzFAUA==
X-Gm-Gg: AeBDiet6PHDSBqMaE9AUBkdZxSNFwBkbcniqrjw8c2sHVBOphsorpdd0j7G3PS/Af6O
	nOnL4gSnQFXQeVXAlZG0CTFDRcKvmK7cOxoukhUBxnzy2Ry3sgOtTSeSG+xx3fR+bG1KVCAbNX0
	Zc32L+9HXTW3wZSqMNPreVzQBNtnvImHoQWjmZX8Mx2kah1YQ2FUPks8GIQYYX/9ijVlczQYqau
	nCoL2H9yxpt9EOWjK+ulYjEeU16JCCtWSbWBRV4llH5PkItQmOUATEmb6LsmLoxfzWKEmdSoY02
	dT50JOt9zVrRutwayuTPDSXSddZiyfKJNcQfuC2Va5cGU2vi4cIuUoNiAkgnE6xT6snl6Ea4Iay
	Kjz1FFgCr+0zn7gAQLQrzvskKaAmnH1IoIYuaiXlDUlq3qGaNCx74KcPdMXyP+CuyVChjQEV2bO
	prQRM=
X-Received: by 2002:a05:6808:1907:b0:467:272e:883 with SMTP id 5614622812f47-4789c740c37mr1031513b6e.1.1775827971847;
        Fri, 10 Apr 2026 06:32:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1907:b0:467:272e:883 with SMTP id 5614622812f47-4789c740c37mr1031493b6e.1.1775827971342;
        Fri, 10 Apr 2026 06:32:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a13sm77991466b.53.2026.04.10.06.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 06:32:50 -0700 (PDT)
Message-ID: <c78fd260-ec2f-42db-82e6-6663b4ec9420@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:32:47 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
 <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lmp-DgmM9UBTr4tXvIABYhOpjt3w1Sp7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyNiBTYWx0ZWRfX2ZHK29RRvb8T
 lQZcWU7cU89cz0CW4AiCtPtmX+6MA3VEoe7J5362SyDcetsh0732AEn9gtw3d80/+d7S3mpNNbE
 z5eGBzYBM/EE9LGnWUvZayC2V13zTCQeyU3LVS02WY1hwMZrfjARnqF0oqdmS/nX2P97/ZagLgJ
 PtuJzXiGqs/kxOz7XscpPlkTtsxYZYEvDk/EDp4eadX9VnXH+aFUTyxfWkC44SV3IOr67ldPXCk
 6/9/lR/67u2sYESvxW8bfozTOS00oN+/wa6DKwkUbK3F1HSmg15Rzt+p05gPYTtbDGoHmNLXNCO
 YuhK9QAPyaK/aJcYeyUEtmDGOWVrceOqu8sRqubYOYINSJIOVo9rD1y5E8iXAhRS692y0NkokG6
 KbYGNHE8l0b91fD5Y+lKrMUraPuDfmwyrqJJHioeB81irmVvdG/yZwr8oGrQfQHNFBluT8xotD3
 XGibVY6h5rAwQqAP2Jw==
X-Proofpoint-GUID: Lmp-DgmM9UBTr4tXvIABYhOpjt3w1Sp7
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d8fc04 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=5k3XNHiivogdNy7buJ4A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=k4UEASGLJojhI9HsvVT1:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100126

On 4/10/26 9:31 AM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
