Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4D15AF6
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512686; cv=none; b=R+LMf5psefPzYNxlBJiwYqSP9IdHYjjUM6keflNUdjdytca9+bSOUjf8MxoTo8VCCEZ7NmVBvHkQA78sc0HMdIogbO2HWs3IWvd1E95b2UnuH4ttY5sMTO1EUagC3wFVXso0kUPnAdUyN39SbPurBulv2UEaK/2se0JFAdxN0FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512686; c=relaxed/simple;
	bh=745XbM+R293U6NPlApp30t2HMHXm/4v+Q8H+vE8yLsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=turU49GeuecrafNYf4QuSJcE4IoJNgtLUg5MuvAFrsCr3tNXYnVOOPTa/wQZbU7WKOGdr0hbqmW6r7gxq+LuxAINNsrnmsZbUdqITISYRorDtGKY3Bv9/Kr/pCwmN9yir9X5xcvGGoGSdqgwIICRtHztN+y2+AdrF3AnRAwhoCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwJe017W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwJe017W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LAr7lT022572
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9imrZN8KkxLJw4ZcE6UYLM4xvLjHma6UdnfjLX804k=; b=NwJe017WtgcjFxiY
	FvI0KGvr8CIJ0WYscZffC+8JtmHCN3ATnnM83sZaOdVyEOHsBGTkB+GfKUf9z1ad
	NjOpRHKlsqrNTd0+Zo1rASOr1E4cmBUBO667y+tWFP4eDjS6f8PaBezGRDkQEeuN
	665QYRJhZmAbtdaiycPnSk+3uiQwCdrQHXneGsIqt8ZYPwuZNiLrL2k2jd31P1OM
	GxpWQ5sWL1DKvSdeXBApjYvd44oEfMw0uPEe9yQOvuJTA+LuPfNXXKtK443GfeIX
	69r7jNugbcIk/0z6a1XNwSsHG4NhM5BxtjAiRJKnqgTMFL0KeOo4i1oLmICQdbgj
	d5SOLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ducj0520-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 13:31:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso72345585a.1
        for <phone-devel@vger.kernel.org>; Sat, 21 Jun 2025 06:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750512683; x=1751117483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9imrZN8KkxLJw4ZcE6UYLM4xvLjHma6UdnfjLX804k=;
        b=YZz4l2gulLIa6cr9q554x/UYs7NzG0e+oLrF2LnHHRItOwwvr/0PStTsara2XkNH8n
         PmkOpZz+i+N3AMzYSn/T9hhnp64rWNhehKFOZdXXCMPBLE3e3+THwUkd8s4m/+wmmBOS
         dRuFl/wpKl1nJGN+J5Io5/PPfGUXcvEBYyNpI6mORp3IHS584P9/2dc7Ast6D8nUyyPO
         M0a852WtRUkfQHlMi+qx5PLq+hAL4VmNE6lOiZ9DFXTa6z9O93jpWeeB8wNd3kTMb2uK
         Gq56PoA4BWePi8LHnJIoI7vK61BJX+Nj13sygE2Q2TlhSfsnAZVq2/hcp80Z9Vcw5gX9
         I+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWoDCsoV9rJSa85mL0O38wXhVyVK3G4vNptwExSVk53fg8FSvCaDllRBQd9iiTmsLUI3pWKrmMPN/cbhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0fp+5gaQ+PK7C7xP4M1PP+FC+MFBDmN4uCOg5W/rbjSZuMO8F
	qrVi5thAz9BeRU3Pr94AV21RmtOzsPHr6Yu6E/tQW1Ztf1ejCouV+WjyjlmFaMWsrTZa4qqFILs
	YJdA08THC9tpwgwXBv9SmTdgRY4IPdVojpQfpLqE6cCse2POjTXTxDKxF9GCDOp6zRw==
X-Gm-Gg: ASbGncuAMM3W5BTaFLQ2TjOoSra7mHI7PpQkSE48oKQgtvIzVG9SiOSk5epFfpos6tt
	2RzUT3IBXhnCjI1GHjh0tzVNCotd4wCJsIKcWclFGpaOyqBk1sa6ef+XdeCIJzcf9rs1fI8rd7A
	Lbhab0FqZhwTwcaH4ztVtHH6s6sT6kbPxmn2o/8FdaCKtp2XSPZjqRY9XsEQtSjRAsDN/DuPWdL
	yYsVg69NCTqy4OQYGVWileqYK2Sg/+qhml/XPuKMlwmCMzkqbUl7D2d04/rvVg6K9IKJUJXTSrB
	fT7X5d2Ehrec73gni8Doq69LYbEn/5HWkbLbEovBfE7UjX8w+utgFMbbulrqPSixuuyM4UnjN0i
	Fpec=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr348327085a.6.1750512682895;
        Sat, 21 Jun 2025 06:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPnraGfBvL4P9bykA/yT+Cv+md6ula2ABkfuQgFa8vkKOqRNiJQoz/xtOasxclp10nTjMA/g==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr348324585a.6.1750512682368;
        Sat, 21 Jun 2025 06:31:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7fc5csm371954366b.30.2025.06.21.06.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 06:31:21 -0700 (PDT)
Message-ID: <3e8700fe-7b02-4802-893e-2a297b7b5a58@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 15:31:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974: Sort header includes
 alphabetically
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA4MiBTYWx0ZWRfX9ocPAYU0sq54
 6LD/9T99kIaoE3V7EBpLczpYtCVqQTwxLEmxgX27SaNfu7JjYF/rjfvt2pcZWCsN0IIAzVQOQmg
 +owrBDt+CqAunMgosi2JY775meFuZMeyKJdt+cBF3AKRW6NC2CtXgGKi+03yg5cQKe9KkmXgOzp
 xlyvbj0lD2SVFokpUMTJosuQFGiUsxUYM3Xs05sQ/58s3JGcnXDmRMTMAyxKB4pgbUZ/HMip9Cm
 sTU/jn4F0ehYTwoI16vvfmLjo60cX0unq7+1uInLO+V82Z45O5sR21jbAQwkG/0O0fOjCoepYLE
 qt/VBp/GgaVVO3dkUlZwXz/pTCh4NTDMtWwjA0mutXiLPpyyyBh1nj8qzJ9S831IJrXdhqBbSON
 PqL73ukR6/0zMvfYv0M9Caegh0TWzj5MVO7ADd/7l+SlQZmMDtESzQfUq5JRu/RR2NBV9JpR
X-Authority-Analysis: v=2.4 cv=MPdgmNZl c=1 sm=1 tr=0 ts=6856b42c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=CZQOM7k-GMDgjQxx0LUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: hvoaxDL4Fy9aefDVx_Hk-6fmgRQhRZfY
X-Proofpoint-ORIG-GUID: hvoaxDL4Fy9aefDVx_Hk-6fmgRQhRZfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=747 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210082

On 6/21/25 3:19 PM, Luca Weiss wrote:
> Before adding more headers in a random order, let's sort the includes
> once so that's done.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
