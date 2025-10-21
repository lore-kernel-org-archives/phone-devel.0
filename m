Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437032F49F2
	for <phone-devel@vger.kernel.org>; Tue, 21 Oct 2025 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049056; cv=none; b=gMU1plUCq8PlgaBGGVJessVVzjz6h1zaTNtgW+L1Wo2A3YWQZqYAu9Z+KBmd373PaoeFxkBM1XDAGn+8LH0K0+qzYVSFoSzejVAsbMKWVR9rXcWTwKJMsYXoEvyJ8mivK4Nc283GxBio+BRgUrWKgNfJnNGGu+x1QjWa/9wydwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049056; c=relaxed/simple;
	bh=Ik8YTK9+li2kctsxdsSAX5UkwYsN4owKy1yNpUgTOtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8YQEG55mEvOOe0pZzygiwfmteaKR6fXQNsAsg93C5gZZE8/zZKI1WLjMZrVtniDAxHB9j5l0SLep3/SKZyQ0rwubRGDGG+3Q4WV47Mhg76+cYtgHXmxF4m7OtkmhpbsX+Y3X+pR6lJxM5YpiVTG8TE3it89R2bE9ovr37WBlVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kx4/jx/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kx4/jx/g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8LwAZ018809
	for <phone-devel@vger.kernel.org>; Tue, 21 Oct 2025 12:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62ij7qlH0jAbXbq+caCTrSlt+OeWrvirXMKUpKG5id8=; b=kx4/jx/gddJzriWr
	YETzYOVX786PvozAsP/T4Wz0FOx8akCyXqVgh5Q7dVI9f9K2ulbuUv4FKE3xhdHS
	cWXt/zrzBUWrlcTK0NHwzyeIYFcV8HPjrV+R/ojxtCu3MiFTFV8VS/aQT0FBfY8p
	UfeYLQZQ1kplAWEuGdy0ptYjmERUddoV2/kXuh4cJwCXlC4RsyBT2bR68L/Z9HET
	K6H89njqOkq7x+GQMrSxPN9JoCCiiqGvWscljfeGp009COA5zMeF/gtmbfAH7tFK
	MJX7SAEZ8AFP3tOAf3KgrHvAEwgGGMi1FwrDkkpQBmGOsW3e5oMKwonatNsWa+XJ
	6U7FSw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469ghur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 21 Oct 2025 12:17:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7f5798303b3so20861756d6.3
        for <phone-devel@vger.kernel.org>; Tue, 21 Oct 2025 05:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049050; x=1761653850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62ij7qlH0jAbXbq+caCTrSlt+OeWrvirXMKUpKG5id8=;
        b=I2H3UlABL0av8YDB4jy6DBdv0v3j73QGaKRVr/fp7TbLfMGCAVCWDVZS5B0wHXTJj8
         DByg6SkWA7WssMeIqQrmGITtGtxeNmnFEgP4+USi7AE4w/qyLDfv1YVXbPcnn++dFnPH
         gKpuYIWh+ViwdkHKlJJ51vfKsSM6i/kFUUFXwOy7f9oo07P/8fQlGIdWPwiFjBeGe9Hq
         R96/KuJYYP1jxykMJP27C8+HHZA6RwebWc/9XlkmMLQKn/3ZUDCRsYJfqLHad6S8ID/J
         a+6mfXMxf9TIAq01YKlr7BjCck9ISxd5GXFZoUYqTfAmKcQICyBxqiEQ/jrImxdCZ93G
         7HQg==
X-Forwarded-Encrypted: i=1; AJvYcCVeLA0WLVN89+uPLc0aAHPaf/1Z8jK56DD1Z8kah74uUMLwCAS/KSwv2b6L6VIcuZlrcaG/BwX1mIALLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFyjGQuWAKrwuaFfYrFsGSqbXqG8DdUqRXz+WOIlYkljYNNMst
	tfg6g4tR7CqRWlDg/HdouwQG7W/2bZYE4vneBtTT46r4VSzwYvtDMx76GFSMvyXnXuVPydMJh6c
	HoydONXqhZ773S/yW3v2d5HwHs5DNLpuCyoKTzQx+iJim5nOXJIN/MKeSnB/75d1YpQ==
X-Gm-Gg: ASbGnct6ZMbHvR/HHqLJhcugXvZIpiE/Z8Ad6b/Va8BvOEssg+xdykZZFEAuXiLduti
	NzQZ6xCjT/rlCJ4UpbCKJycPXe9/4nzk2othpyg00LhsUCj328Ny1tsam9F88EkEGTFuvC3qLGH
	XKwabQIj5zY3R9/5P0iOFijHO34Mbfw/eklnTiwNSyqPWRXHPYdusyRDZb4aLOA4SqGttoqYRrY
	/4OL3qUgvDGy3/8BHLHF+fmt4rhT8Zzmzlx2LiXp4o3ijsOJgOZvDEuDXEN9r/IJqdEOXBVmsuP
	Lc1nEuiLaiA2A96jOLYpQhygU+UPxgf1Kmbiqe68gF32CeMfaTrNwNitanfhyG6PImttety8+op
	akAubXOwK7vzRd0JvJnhWLZF/DtyK/PGp7ClIHR8PuForKwohqDCciujG
X-Received: by 2002:a05:622a:180f:b0:4e8:b138:2a0d with SMTP id d75a77b69052e-4e8b1382c71mr98419851cf.12.1761049049865;
        Tue, 21 Oct 2025 05:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9wVa62A9QqlswXTFOtj5hMm5dxSnWe0OKPK/itVnOD6rHNI29MyrzCPqYx7/z+6jDyT0yqg==
X-Received: by 2002:a05:622a:180f:b0:4e8:b138:2a0d with SMTP id d75a77b69052e-4e8b1382c71mr98419361cf.12.1761049049358;
        Tue, 21 Oct 2025 05:17:29 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c49430145sm9225871a12.19.2025.10.21.05.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:17:28 -0700 (PDT)
Message-ID: <e63dc4ce-8461-41f7-8dfc-3fe531d69f4e@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:17:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
 <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fu6rFbzqvTuM1HkI4Gy7sLoBm0WUotcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX0PhzNqgsfIYF
 T+kkKPzb5mlFovrFkwvtbAYbQR88NSCJYAYaWdC9JYpOJPNvgyyotxwXY3aWZLPtl09HJ07aTmM
 I462JX8FGamCvF2NaqISC9fpMxXX3G5X0uHs2VeJDJy6/USGY6FfiRxVbJDb5z1WeBa4UMtNPm2
 oHoo/QkBjee/RC4a668wPvEuLPYtFiIFfiautPWg7OYA3aCd5gyyobGkGO2SaiIolJQUxTMHu3U
 VDBuCmElG4YqgIE6S1pZ9MUU5XIZp31SC47MG46oMthKSE8Z/vCSe4yYCGtxFUVg5rRPcD/E/PO
 Dj2/owUbTPOFTTO/Rg35JJIKqxAceDop7BQ+H+p09vuaoWJlvy71hDo5b3egr9d1KrZ9c4bFwC6
 0D1lquZ7Ci0OGCqZeV9IJ7pjSnf5gg==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f779db cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=BITFXGdF7uWLIDnxD84A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Fu6rFbzqvTuM1HkI4Gy7sLoBm0WUotcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/21/25 1:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Samsung S6E3FC2X01 DDIC isn't Simple DSI panel.
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.
> Remove it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I think you should squash this with patch 1, doesn't dt_bindings_check
error out when a compatible is matched twice?

Konrad
