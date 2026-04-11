Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B963859F7
	for <phone-devel@vger.kernel.org>; Sat, 11 Apr 2026 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917804; cv=none; b=JvdaDQYbZezGzEG7nBWvT/rzS4HJF6fL7TDIYD6QPFBLjYgYiDb+JXXpjeQcYZ0pjRWcVuGr5BkceoE6sHXvUuhwaQSOW8Bt79EPeUFP50QuwbfxY/doh/O3j1gBtFFdJA1Xf2Zur+0f9C+t+HJl0DOTxmJCYdTcaajfWxJ8de8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917804; c=relaxed/simple;
	bh=dO6LWOlr4W9KjJsIaQ/g+VU4Ji5TInycrleQSx3ONUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlyXGUs6A6cJ3AywvsSYRGz4wi/eRviXHrvpHVdVki3kDcpJ3mqc0P0QwdYUZhqauUw4KBE8WncV1p+fDJDv5xEhNT69uE1q4JIJJXnJ9VGUSRrxT/G7e7BeL7GRSbN/DMCH0wi+YfBqGz4qZEbbR13IegUiTemljmsJ2+rfas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov7P4oSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeXp9w9P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov7P4oSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeXp9w9P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4lP2w1836090
	for <phone-devel@vger.kernel.org>; Sat, 11 Apr 2026 14:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Odlvlj/6+ff16oUwlM8mU+eF
	J2ei5xcOmDMIZAsnvOg=; b=ov7P4oSRmfEPABLGy26lijgLv1dW2hA2IXWCwrtJ
	TKYszGPUBKjyCbH1coPAmskAIp7cw9/VkKg+jcDXcmhZD1tw1H/YQwXWsta/3ljX
	HQFvTVYzuaNdpth0iufnHaKCBvgnJxrgKKptjfGJ8FCT8hohthSCkUicu1qLRYZ8
	sl9wV0aRujGE7y449mTHLOFYJxgo0/dmaOritvwR2olK0zBrMZ2JV1+V7LpG3LWI
	JyoDb9KHzMzWUTY7LXI8UfdU+dCUNbmLUlEDcu+Bnl54/eLtSzpzKXK32ba54BKX
	xaoim4K0DfNKBzXXSjUG9YU5CNH7YI8JyHxHTIIowmTPcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6gtnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 11 Apr 2026 14:30:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d3bb33c8b8so616731985a.0
        for <phone-devel@vger.kernel.org>; Sat, 11 Apr 2026 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775917800; x=1776522600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Odlvlj/6+ff16oUwlM8mU+eFJ2ei5xcOmDMIZAsnvOg=;
        b=FeXp9w9PRJpIJuidF1+dXiq4iFgI9B17+yJ/ZsjsW78pVFQyliAWCuF8bSiF5yvj85
         rPv0TqmWZTYYSEpjNUvU10yRG60ydXEKa/FPlAcVj917hLMbsF0M7yzYye7U/+qGnP+4
         2djHPrNla9/hNndMwBYFj1Z/qDCpBxxpVUsuOfE+YLD1lGMno6FVWf4cM/YLevfnQ/Qv
         GRf0x3F0LISpb6HePu66LOBMmGjg76OCUns1lRBMNf8hN96CnOyye8k8+XCoDk2eMbgt
         wq11Rj/sHpk1gwlDn7vm4QlT97QF4qOJIqucfNjl9o9Wpa0CWvf8OMrLoBqoYFs5cGJo
         CBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775917800; x=1776522600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odlvlj/6+ff16oUwlM8mU+eFJ2ei5xcOmDMIZAsnvOg=;
        b=d2upK7dIhsrEFVirqp88cQcDxKu4lRw9ZCLCP/uz+HzE3MJbh5hKEkDzQceBvg5m/P
         iwt0fYQsopwvKYASlt55JQxZPTmiOaPPhaHMSWGsAQj9ghdDFi3TtOznJ08P/Dgsx6hh
         Ypq/GcXgbRq2xJKLl2zTPr860APVSilLqWVwJXxX+J+Xy2+bxjWlM7nUKerPx5jdzLz5
         k8ZQAGA093qkoAZ9r36tBnrTCbXQbJ4maMJQSAJfoaJn7MR7PUP9MzNh+mFFSjF4Cf9G
         yFBvRNgq8es7KL2c4LES1U2uD9fT+gbQPXIUwgG7x+89splDnf7jTkuvYmNzz32YS7XS
         67og==
X-Forwarded-Encrypted: i=1; AJvYcCUL33usiFe1p6PF7MJMjotJwvWwOb6IDMlTXIPX9WtqWpThN20V9Op8tt47qWCuXP5mGFcU+8GtZ2yPCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbexyOKFiBPsnQff9vc0p4DsO1GYhRz165UJ5AL+j2sWTfm0/u
	uwKDeHyWVmfhp/3dlmIFMlWQgHysWjs/CbJNcQHY8YPUmrW4c7ZJPqiJql71tpxET2qVJckFg+u
	G/XE4Mx6wGEfWxomUG/WGQcavuf+HXbQHJSq8R2lZCRSSg/z4ls/2mE6OBZxlLAIkdg==
X-Gm-Gg: AeBDietPOjwZQ7S2oVyoXS03WZmnIerVHfJQJ/4vAYSytK3ceKCj7uLPd5PbD29YuA9
	mQe8id0ggNtemvqejbS7oEZWx0sqpdxZZIed1awWMoIS6Q27jBFmZ68eovMFPxkG15ECKOiPaLj
	6ustB6L5vZDpS1KC7B0bdbv7qeVeSrzwGXWnJ1J8CZwwBacpV9t+pXuZ4MULlZ1sWWTiT2PIngw
	XdRoDwaaYAGzL/FU70xbrrqmGu7kFlWIFNkjuNL91sxNyT2QuOe0A6D4hqpJNe9zKmB01bdq3Qp
	MM8Xub9UfDXmfzPwVWLUvCwumANI8KCzWmy4JOyuGjAudKZqXmd1Cwt4vS9ks04xQkPEChJ5TO9
	i/uFx4igI+MU/5QOmqIARF64y0BpAzDcwcCWGpdkB9K4HcqvhU/hLvMpdFNl/+1z++opiKWbSnf
	pPkIt6/3l09UbWRKi1CyKRayY+dysQ99X/cwg=
X-Received: by 2002:ac8:7fcf:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-50dd5b51ce1mr105442741cf.28.1775917800273;
        Sat, 11 Apr 2026 07:30:00 -0700 (PDT)
X-Received: by 2002:ac8:7fcf:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-50dd5b51ce1mr105442431cf.28.1775917799799;
        Sat, 11 Apr 2026 07:29:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee865dcsm1472187e87.14.2026.04.11.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:29:57 -0700 (PDT)
Date: Sat, 11 Apr 2026 17:29:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
Message-ID: <glrmouz7w4jomzv3io7gg5u2gtwrbm6zmhk2qcivlzmdr777t3@5w6dr3g2g3k7>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
 <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyMyBTYWx0ZWRfX2MNgh+Biwl3t
 JKX+lA2eJgCBb/wBin6YvlBxXSFw6uZhcR8YCUZh7+1oQtC8aY2Pu1tgCiUdX+WC3HOhmX+5MeV
 93Y9ATUdskdVDWQ3zikpu/YXEhVH7xBleQiurtR10NoGjkLxZJ1wWtYVxEHNiMsBHky7z9Bq1xd
 B/1e0FOXyIpU7QowUmqWWgeiZbJrJ8J6KZ2oZ/V7iA5M4lNm/DnBBKhSHkLsvAWqvQzccQf0sbv
 7dQvWEqakFGNzvh/ZvemR/OdJBFG1znK3ERb7Zqpo8vvqqBNND69FFaba2XleXDV1fhJQ9+tmHN
 xv+kHIwpq4Kk1NzSe+mAbyz7bbtPNriJ2Eab1z5PJczcjW43DzE5QioqUlb/OgZVPuQlp89DZhN
 aTL4SGQrob/QtG2rn+Zr8vIsGd3q3r/dapjf4Ztkc+uHII6l9ikGROJhIAXiZUvUPfmn42o28zG
 F4pqOrhtdp7h8NEmMyg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69da5ae9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IQwPDdAkxhL1BqWhGTbq1nxhPJRK8iF7
X-Proofpoint-ORIG-GUID: IQwPDdAkxhL1BqWhGTbq1nxhPJRK8iF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110123

On Sat, Apr 11, 2026 at 12:12:03PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe the white flash LED
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
