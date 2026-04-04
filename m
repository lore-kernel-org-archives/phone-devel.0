Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5133431E6
	for <phone-devel@vger.kernel.org>; Sat,  4 Apr 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336695; cv=none; b=QprVD2YgSdT9VfBOTQ06vCSSLA2BmkBG58OiKLJjqnPIICK36bARrNwYD4WtROe7ToMum2JP36e7vrwAb/uKsySda+ie3la+myVD7j5SEX4Cs/oLdwpVr3RDXXI0gI26PjbHofdbvhD2qUo7KcC5drWtZbAGnXd1HI23vfL79NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336695; c=relaxed/simple;
	bh=gQkxawafjezVKnoesLe0QjCR4a1/sdvaYUZkwHBxPPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4CYjD80Re6y0etvKpkHZqDMkt9+0Gz+KcFhovjgREt5yY3W3AY0GblJyMkoQ4pHrStDf1j0Njzzz6x8OTvAhf2rr6NfS4SoSvg2DPT5oXBzElFJOYKA/z5pUv/qRxH7HT+uhO5rp8AVYoC/jG+zRwMILBx7YfegpmL8eyy45Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8kwAuDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwK6Gh4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8kwAuDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwK6Gh4T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344BoOs3884322
	for <phone-devel@vger.kernel.org>; Sat, 4 Apr 2026 21:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssFVauwzazEx25EztfIJnA/7
	6jufTDwP8FuA3yJN8zE=; b=R8kwAuDXYXTUTL5cYv89+XnMMAdOJv+IbOAcWaiN
	gYffeAXc/CWjh5kYizRDTW7Lt8HhemkZWue8llOYkeFTTjwRuEVIz5v9DJRQZ8vZ
	53HKZ8pL4Ara+xjexUD7lI1XExLZXer8Ka9oYKTlsGYsmbpkmUcXVQOKKwYn8WZs
	Xh4YIWftpWZw3F46kWvgYQ6O/0Bet2UcYWdm99VJqduWUa2HHUyX1g4FiMwowup9
	uePYuqCzRjbLEWZDoA/moU7Cvo+4U2LWoPq8ju5Uo+yoDKW1+FH43CFfY1BrLZai
	PdG1mXGkE0hbQF9Idf9f3vkIpNs3eo7WyGz/XBP6Td2pVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd1dgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 21:04:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso8405751cf.0
        for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336692; x=1775941492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssFVauwzazEx25EztfIJnA/76jufTDwP8FuA3yJN8zE=;
        b=YwK6Gh4TL3wWhvIguI4uShRnv6NaI7JkYhPfcAF7tOKI3KBqLR9PwbXDFy2/rcygjy
         2h+gVeb9v99UMBLla5VlcIWzUmC/rBvRJyxfV7IdoF/Nh56atZk0hMYa9mK+NBjzerR3
         f3DkA/rZ149s5/0Ey1W/9cuKMZsnMdbRot6uF07B2jE6248dmh7kioJzg9mOJFBrSSR7
         VOd2izolViIUTcEvDZS25XZt4AO48o56bh75rOFVRqBRB5L/LLUDEgZ5OfmuF4laGpVw
         gv3uShg/LlBGe3Suscj+ER6qH3Jf8Vs2PD3aOK8Dp+c1dE4wjjoSh8nEDrTkwkpGhm6r
         dp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336692; x=1775941492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFVauwzazEx25EztfIJnA/76jufTDwP8FuA3yJN8zE=;
        b=e1F8HNFA8OY5mjr+BTA+lPomFNsD+1B3NHKY7u+O9wt8Apk4Q4m4QwLEstOE4V9fII
         PwgDpd1TQ93O94Nedf0Bkzz4aYVnsEkSciR8Xo/ybDTzeRZjgDriEJkeG46qqVI9lmeW
         3qOt6u3RBndVrbBnkHfwho2Lb1GT1OVf3HHX0E6WG5snb11ACYpXIZhW93A59s2L0UBJ
         y5bjSZyZeHLOCl+kN5otdG1ILYm4aGIYMUtlRmyTw2G55ZUuflqbruiieZRe4Hsus2N+
         oJWf2eGrJRYYCTFqj6PAia9Pq5x/3xEHzX4N8u8Zy4piW7HIte/ccAg8lMjZh/7Y9zps
         9Gdw==
X-Forwarded-Encrypted: i=1; AJvYcCXumxE1pAG2yyQkzUhe0dZNtAinyTKVaLn9AGis/7rybq7lldhkNp6IBj4fZCLyfKwl1eD2JRoQlZfpTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWkJi5sWMciDfaxeT2ToV9wvTwJqBdccQ7FWU1MdnN+9eh3zS8
	fhl0587tOjZMS4+sYlgxfjaHpvSxVWCZWNgsjQZFNGhuCMN6VToHjAkQENhK7uiK5KnCTly76kE
	q5JZ/ytaaouyAeTOwjeROHmm1uZCsCO//5Ik2gK1g77+YtEr6jjME/3rnAqOtYXHz3g==
X-Gm-Gg: AeBDiev8KrSZUgpkHjes050vi8ZcWWSchjiIklp1qsWJhK3PihijQjZcfk/k7wY2xpv
	FJnYB/wO4CToRD6AYLNKpzPhAFn3C/N/wQaVps1O+77+H+sxQJN7TERhrnFgbDaEuj8vxRcM8T9
	uDaQY6lV8UXrHbkV5vi2ElX6CqipwP1jQegSvS7UWaws46ynQvtuc55FvrhpWcBdKtLLfhQIn33
	OC8utPEFgDi9ucT/B7qedx2zzkFtYMDRYrMl+vP3h76hSyZoRMlt/pYQFo36Q3vTRSynx9NIwsA
	lNzSNimtjNoc7+Ng5A/4GIK+2NK5jTH7zO6Xa7FWpo3pJAHoQRqJPPeECCHnrAL2amDjD4bWYta
	uhUtsHkIgZukFa7GXX26FNJLsbkjG5E/ZAglJ66hoUMV4DO9OXpfzG0KiZsLZfPVf6kNsmLSkB5
	kTsu8VrH1imsrptCnBHf0TeFAJD6DLiKXyq9s=
X-Received: by 2002:ac8:7d15:0:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50d62cf7c6amr116122311cf.46.1775336692288;
        Sat, 04 Apr 2026 14:04:52 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:4d3d:496e with SMTP id d75a77b69052e-50d62cf7c6amr116121971cf.46.1775336691875;
        Sat, 04 Apr 2026 14:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd8491sm2317998e87.83.2026.04.04.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:04:50 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:04:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
Message-ID: <mall6aengyapawa5gpkel4wuswhq3c32wf2v3sdp7m2msh3zxt@2tpezkny3my2>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
X-Proofpoint-ORIG-GUID: K2jrotLKMTebtqh0H0VO6PkSDpFqHwDv
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d17cf5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jzbMb8GUTuS7xUAGJTsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfXyURG9ps3VHPU
 p96bPxFquIyVCqlkOjJypmIDzI0RuD/yBih8L/FQazdjbFjgb8XzxqkWn/1y4gAjMoAX6eIKIWm
 8AZ/g6IRff5H+QrzQDPfPEF+dTKOvQcgYdvWukw/pXEfl3hyXrlshLjUdoFdBxvcgJdIWSprIn9
 XW5ptn72V8Q4cSY5IXR4+RcufeRTvULZ27rNPEZ5zLmjSBoXxLuvjIKIuaiR4kDmjRMxAdDj7Xm
 XYcBcjHozL34LNNuhFYOYOv3Tef2XrhVOPwEbFt5zOPmgLlh62tP9Zvdil+2t1eR7nTVjcNYQiu
 4tgCOtb4gIGR1mb05a3z2QXQyDuXzGofpUd4XI0FlrO7MUXyC4dMANDT5Xl0Mh1veyjreqQo657
 JgqFeOQpPR00lAxWE7CvCS9EG9xx1RCI3RlLtEIC6dG4CLVzjCDsNJNwRynf7egDBO2oSPym285
 cxhHJB8DIYf2GLbgbmQ==
X-Proofpoint-GUID: K2jrotLKMTebtqh0H0VO6PkSDpFqHwDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:49PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN553.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
