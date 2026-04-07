Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE683A4511
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557673; cv=none; b=WLeXCXL8Qs7StWns4zesSkjk6SOg0PbTeqeF7HwqTNxGB1BAy/0NqRUtokQpaCyATc4pumD+w2d7sY2fbAWINyILKZoGaTIzq7KPq8WSE+l7xx6L1vSvScxtiXLg9tLrNT9g4HcNaxioso3YuSHELDViHlJlN6PiW/EP9ix0jio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557673; c=relaxed/simple;
	bh=5fYHO3KqcPgzl901ddbUgPijAI8fEqD70vuVnZOSgxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smy/h4MkRVo/u7Nk49IlONuabGqnjNwq1mpWbyVQeKfcmv6ZoT+0JCVx5rmUTwv2Gvs25AdR45vtRhiwoaDZC8V08YDIrKkTWyI+62NPebhlq0pby+MUjyPmfNJgV7ZvUHYUL1zt3NaaUzRZG5WanxKjE0nwnPsprdPqo+s3Dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BI/sB+re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VysHY567; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BI/sB+re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VysHY567"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Bn492550794
	for <phone-devel@vger.kernel.org>; Tue, 7 Apr 2026 10:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=; b=BI/sB+recpRIGuvU
	z4cMdzyams4wWOkId1FO7POs3U9mGnNpC/r3N1sz1+3LYX0LwEWX/N1eWu+fQEY4
	RGSfXspzScpGdljG7IinuXEQpGJFI75EpKu+031EzmVHubspP0LCd1lIWQp0XkQU
	fqw1OiyXLcr6V9pSei9kAOkpgcVn581iNbn3Yc3wd+oV9+zxecIJFJh7vVANoB+z
	El12ovq/tTV4oto16mnT0pVh5MVAk1IyDbAiz0nS8GRgwJYVX5NMLyy1oS1ZaeQ2
	xA10lO3tef/iDPNRWtgzeQo0OGYamer+4rI7fuJkAv1Qj+A9ZkSe6v/8qs3tUV8C
	2ky0rw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea9ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 10:27:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso19006786d6.0
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557670; x=1776162470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=;
        b=VysHY567AVQbmEzYLi3kd7FIi+rW866LBBQRe9Psf5xvEd0vD+c0C7Rj0qlAVPNEDF
         wUeAXJymSCawJne75U4FxwNiR/wrWebjxxxq9DOFMW/k6t50QPjhVKHwIwq/kPMEQgwh
         9n2anwXyAuISTzcF8W9HK8ihlrwD675zcFOb0BYWGxWLDrMnyMPLQmJCaFtp1cdxHbWX
         o01Ojg1WaiwSIKihQhd5TNVgnUz+ply8ShxUykFjt99nWuy9Za/xA+dHeykvvOrDFjlT
         9RMKRiMy5G4UfdPexUYIx6dzBvc/CVWo5Cs6qHJrwR2FRyAxHu+HaJ6SON+LY3c6P9ET
         4vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557670; x=1776162470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=;
        b=OiJ7BeGt9dEi/vu8789hQAoPfudHr3EtSprtJenTf4909GkH1sjQGxo9sV/WWMyPOO
         ah+w/sV8MhAFbsYE+YiyVxgg2U7XfsYY4gRKqF67RKqpiJ6SBgak6w4xm06wxB86bNWG
         CdbcHCHJZDpJn5BeY3RJ1SuAXe6uUOtlqJRHVZP53Vr+uh7sbvDx8wBCG/2CxfAk+mNR
         cBgWtVATi/aDi9kaeVFTEVJPAc4sihbx0T+iUZpZMgonGGz10hCCIN3h/ZmDyYxWXetS
         DpuKYDD6g3tAizlKoPBkGEGjyzUqe3UwTNai+tSt3QsZM70LHLY9HgMJ4L7HUUI0nZVL
         LmPA==
X-Forwarded-Encrypted: i=1; AJvYcCX+SVltZWwKrS4N3u3+RzOoUTkYfqtiTRY5ReVgaU8Gz11o5IsXQRAWcyNG2KmpR3UIopFzDQa7aScGeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IgRWNQpF6yy4ec5l+XWXz/oB7gkgWwz0CQOZVlJLgcA7qX4C
	wJkcmlwzpykilAmlNKvDjQ4pgojxhn42krss9JON5iVADHkUSnDiI6if2NrqvXbIt0UerQw8DFT
	T8IBP9QFThf58OPAW8Au0sFzUJU+CSZiXA6kNAHbqQhDG5hIqhUewizh6GUNbGRE4WKZsisAfbA
	==
X-Gm-Gg: AeBDievY+GM4nkFUlfgIeKuxPLYor7hemW+IJQ89WPxNyWMPqSHJLOZ/11ePds9VX52
	gle9RuTlATWpb+kbUUtNVxw7V5sweKTppSoerUBEhBjyC+RM1xQ+hHnqPOw2EcOWuWLirhhYkmW
	4Xp5XeuORw+2fkD0T4OOyTW2E597iMZi6jfwaqV4SYlNwP96nuMzqt/CCJsalFWUYTD3vOw1UIE
	cP5D9a/wICqR4GHPpCvbn3CQJDvCubPnJegEeiQlo81KmKUBeAme32XAnBP9xTip+DeVnQ/giqV
	wGSQmUB1bZ8ndYAXHhWHPLf/HSQQEVC2el3BoQttGCRiA/UNKpDHlBwhn7AmRxI4Xf7b+v3zer3
	wU+83e15gRe6cUl3DRqGelBv7ix0Lsj05n8bgnZqPgHIlYObycAGko6qTU25kH41qX7OweXTRgR
	JFpIQ=
X-Received: by 2002:a05:6214:f06:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8a7048cce76mr188034496d6.5.1775557670609;
        Tue, 07 Apr 2026 03:27:50 -0700 (PDT)
X-Received: by 2002:a05:6214:f06:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8a7048cce76mr188034276d6.5.1775557670133;
        Tue, 07 Apr 2026 03:27:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm554038066b.30.2026.04.07.03.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:49 -0700 (PDT)
Message-ID: <04f8e384-9e18-43ca-b277-d6dfc5513303@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:47 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4dc27 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8 a=iV2YkS5aR9AJb_P5GS8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: btmEQqdU5lqh0yTGXfonpjcD-sWzPkJ3
X-Proofpoint-ORIG-GUID: btmEQqdU5lqh0yTGXfonpjcD-sWzPkJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX26dgX408MP5P
 GjMA3BnJxHLUH4my6UHOGSJB0QYX9y+XB9ZosbKR+BwjH4sjFgtq6+oj2Yjh4Z69wHm2VSM0zep
 yl3Dql8Xq+T4zmBDegc9vz48rNPosRQjrJzeg/zlJHQe6qPcUrOJLGV3PH6oKSUCDxgu4FdS+QW
 ldllvMQZyLnj96Mb5doH4vUa++kEJLkWsXFfYR8wUHCADo/X8IWqJYtLkj6j+8HhkAdqVa1ITjX
 n7uv8ohEgz3S5nvrGNA/nsqtwDbThesV6wVIQDNUFwg7/EPKD67iCT+nrKcOBeGGH9TRerGzT2u
 e/30hk9wXc435p/M/ZgUHI4cUoHlcc1qgFHLwzFrMU6ECIKEJkBPu2GoOjPf+Or0Z0JIkH93Yfx
 1mPbWRT1eDa/6owhComIYBfBo/CoGBP88fQAtR1+Q/EFLvQODBsoDPQELcjuq4cgbqzIEfIvlQd
 SRaJbu5y1P8OVuXi7Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the NFC chip used in the HTC One M8 to its device tree.
> 
> The downstream vendor kernel used an I2C frequency of 384 kHz
> for this bus. Use the same value as the vendor.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
